package com.okrajni.okrajnipl.api.controler;

import com.okrajni.okrajnipl.email.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {
    @Autowired
    EmailService emailService;

    @GetMapping(value = "/api")
    public String apiTest() {
        return "api working";
    }

    @GetMapping(value = "/api/email")
    public String emailTest() {
        emailService.sendEmail("tomasz.okrajni2@gmail.com", "testSubject", "test content");
        return "email sent";
    }
}
