package com.example.demo.adapters.deepseek.persistence;

import com.example.demo.adapters.deepseek.external.OllamaClient;
import com.example.demo.domain.model.deepseek.Question;
import com.example.demo.domain.repository.deepseek.DeepseekRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClientResponseException;

@Component
public class DeepseekRepositoryImpl implements DeepseekRepository {

    private final OllamaClient ollamaClient;
    private final Logger logger = LoggerFactory.getLogger(getClass());

    public DeepseekRepositoryImpl(OllamaClient ollamaClient) {
        this.ollamaClient = ollamaClient;
    }

    @Override
    public String ask(Question question) {
        try {
            return ollamaClient.generate("deepseek-r1:7b", question.content());
        } catch (WebClientResponseException e) {
            logger.error("[DeepseekRepository] Failed to get response from Ollama for question: {}", question.content(), e);
            throw new RuntimeException("Failed to fetch answer from Ollama", e);
        }
    }
}
