package com.example.demo.domain.repository.deepseek;

import com.example.demo.domain.model.deepseek.Answer;
import com.example.demo.domain.model.deepseek.Question;

public interface DeepseekRepository {
    String ask(Question question);
}
