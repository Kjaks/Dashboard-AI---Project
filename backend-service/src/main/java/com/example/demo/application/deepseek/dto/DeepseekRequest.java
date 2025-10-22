package com.example.demo.application.deepseek.dto;

public class DeepseekRequest {
    private String question;

    public DeepseekRequest() {}

    public DeepseekRequest(String question) {
        this.question = question;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
