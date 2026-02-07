package com.techsync.techsync.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {
    
    @GetMapping("/")
    public String hello() {
        return "Hello from Spring Boot on Oracle Cloud! commit";
    }
    
    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}
