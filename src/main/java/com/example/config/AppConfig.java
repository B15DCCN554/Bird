package com.example.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
//@ConfigurationProperties(prefix = "app")
public class AppConfig {
    @Getter
    @Setter
    @Value("${app.background-image-url-footer}")
    private String backgroundImageUrlFooter;
    @Getter
    @Setter
    @Value("${app.background-image-url-header}")
    private String backgroundImageUrlHeader;
    @Getter
    @Setter
    @Value("${app.title}")
    private String appTitle;
}

