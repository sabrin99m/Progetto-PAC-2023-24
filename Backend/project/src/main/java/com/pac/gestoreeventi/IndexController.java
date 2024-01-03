package com.pac.gestoreeventi;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class IndexController {
    @GetMapping("/")
    public HashMap index() {
        return new HashMap() {{
            put("success", true);
            put("hello", "world");
            put("new-message", "adding a new msg");
        }};
    }
}
