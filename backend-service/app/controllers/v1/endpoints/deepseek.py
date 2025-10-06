# controllers/v1/endpoints/deepseek.py
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
import requests

router = APIRouter(prefix="/deepseek", tags=["deepseek"])

OLLAMA_URL = "http://ollama:11434/v1/chat/completions"
MODEL_NAME = "deepseek-r1:7b"

class PromptRequest(BaseModel):
    message: str

@router.post("/chat")
def chat_with_deepseek(prompt: PromptRequest):
    payload = {
        "model": MODEL_NAME,
        "messages": [{"role": "user", "content": prompt.message}]
    }

    try:
        response = requests.post(OLLAMA_URL, json=payload)
        response.raise_for_status()
    except requests.RequestException as e:
        raise HTTPException(status_code=500, detail=f"Error al conectar con DeepSeek: {e}")

    data = response.json()
    # DeepSeek devuelve la respuesta en choices[0].message.content
    content = data.get("choices", [{}])[0].get("message", {}).get("content", "")
    return {"response": content}
