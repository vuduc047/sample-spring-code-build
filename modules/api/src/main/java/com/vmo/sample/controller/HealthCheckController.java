package com.vmo.sample.controller;

import com.vmo.sample.base.dto.Calculate;
import com.vmo.sample.base.service.MathService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ping")
public class HealthCheckController {

    @Autowired
    private final MathService mathService;

    public HealthCheckController(MathService mathService) {
        this.mathService = mathService;
    }

    @PostMapping( )
    public Integer calculate(@RequestBody Calculate calculate) {
        return mathService.calculate(calculate.getFirstNumber(), calculate.getSecondNumber());
    }

    @GetMapping()
    public String ping() {
        return "pong";
    }
}
