package com.sample.codebuild.service;

import org.springframework.stereotype.Service;

@Service
public class MathService {

    public Integer calculate(int a, int b) {
        return a + b;
    }
}
