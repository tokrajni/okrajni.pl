package com.okrajni.okrajnipl.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class EmailService {
    @Autowired
    JavaMailSender javaMailSender;

    @Value("${spring.mail.password}")
    String dbPass;

    public void sendEmail(String to, String subject, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("tomasz.okrajni@onet.pl");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        message.setSentDate(new Date());
        javaMailSender.send(message);
    }
}
