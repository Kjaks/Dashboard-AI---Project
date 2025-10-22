package com.example.demo.application.deepseek.usecase;

import com.example.demo.application.deepseek.dto.DeepseekRequest;
import com.example.demo.application.deepseek.dto.DeepseekResponse;
import com.example.demo.domain.model.deepseek.Question;
import com.example.demo.domain.repository.deepseek.DeepseekRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class AskDeepseek {

    private final DeepseekRepository deepseekRepository;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public AskDeepseek(DeepseekRepository deepseekRepository) {
        this.deepseekRepository = deepseekRepository;
    }

    public DeepseekResponse execute(DeepseekRequest request) {
        Question question = new Question(request.getQuestion());

            String rawJson = deepseekRepository.ask(question);

            StringBuilder cleanAnswer = new StringBuilder();
            String[] lines = rawJson.split("\n");
            ObjectMapper mapper = new ObjectMapper();

            for (String line : lines) {
                if (line.isBlank()) continue;
                try {
                    JsonNode node = mapper.readTree(line);
                    String responsePart = node.path("response").asText()
                            .replaceAll("<think>", "")
                            .replaceAll("</think>", "");
                    cleanAnswer.append(responsePart);
                } catch (Exception e) {
                    logger.warn("[AskDeepseek] Unable to get answer for question '{}'", question.content(), e);
                    throw new RuntimeException("Failed to parse Ollama response", e);
                }
            }

            String content = cleanAnswer.toString().trim();

            if (content.isEmpty()) {
                logger.error("[AskDeepseek] Ollama returned empty content for question '{}'", question.content());
                throw new RuntimeException("Ollama returned empty response");
            }

            return new DeepseekResponse(content);
    }
}
