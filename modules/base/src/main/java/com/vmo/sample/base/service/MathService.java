package com.vmo.sample.base.service;

import org.springframework.stereotype.Service;

@Service
public class MathService {

    public Integer calculate(Integer a, Integer b) {
        return a + b;
    }
}
