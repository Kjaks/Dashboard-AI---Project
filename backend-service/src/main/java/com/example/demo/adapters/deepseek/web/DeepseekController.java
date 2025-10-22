package com.example.demo.adapters.deepseek.web;

import com.example.demo.application.deepseek.usecase.AskDeepseek;
import com.example.demo.application.deepseek.dto.DeepseekRequest;
import com.example.demo.application.deepseek.dto.DeepseekResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/deepseek")
@Tag(name = "Deep Seek", description = "Endpoints for Deepseek operations")
public class DeepseekController {

    private final AskDeepseek askDeepseek;

    public DeepseekController(AskDeepseek askDeepseek) {
        this.askDeepseek = askDeepseek;
    }

    @PostMapping
    public ResponseEntity<DeepseekResponse>  ask(@RequestBody DeepseekRequest request) {
        try {
            DeepseekResponse response = askDeepseek.execute(request);
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            DeepseekResponse fallback = new DeepseekResponse(
                    "El chatbot no está funcionando. Lo sentimos por las molestias."
            );
            return ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE) // 503
                    .body(fallback);
        }
    }
}
