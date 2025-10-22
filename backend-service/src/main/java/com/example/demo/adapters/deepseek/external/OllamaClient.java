package com.example.demo.adapters.deepseek.external;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.Map;

@Component
public class OllamaClient {

    private final WebClient webClient;

    public OllamaClient(WebClient.Builder webClientBuilder) {
        this.webClient = webClientBuilder.baseUrl("http://localhost:11434").build();
    }

    public String generate(String model, String prompt) {
        try {
            String content = webClient.post()
                    .uri("/api/generate")
                    .bodyValue(Map.of("model", model, "prompt", prompt))
                    .retrieve()
                    .bodyToMono(String.class)
                    .block();

            if (content == null || content.isBlank()) {
                throw new RuntimeException("[OllamaClient] Ollama returned no content");
            }

            return content;

        } catch (Exception e) {
            throw new RuntimeException("[OllamaClient] Failed to call Ollama: " + e.getMessage(), e);
        }
    }

}
