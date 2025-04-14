package com.example.coding.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    public void addResoucresHandler(ResourceHandlerRegistry registry){
            registry.addResourceHandler("/**/*.map")
                    .addResourceLocations("classpath:/static/assets/js")
                    .resourceChain(true) ;
    }
}
