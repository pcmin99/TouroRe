package com.example.coding.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {


    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // 기본 url, 권한 설정
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf(csrfConfig ->
                        csrfConfig.disable()
                )
                .authorizeHttpRequests(authz -> authz
                        .requestMatchers("/assets/js/**","/assets/css/**").permitAll()
                        .anyRequest().permitAll()
                );
//                .exceptionHandling((exceptionConfig) ->
//                        exceptionConfig.authenticationEntryPoint(unauthorizedEntryPoint).accessDeniedHandler(accessDeniedHandler)
//                );
        return http.build();
    }


    @Bean // 설정 완화 ( 임시 조치 및 테스팅 위해 )
    public HttpFirewall allowUrlEncodedDoubleSlashHttpFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedDoubleSlash(true);
        firewall.setAllowBackSlash(true);
        firewall.setAllowSemicolon(true);
        firewall.setAllowUrlEncodedPercent(true);
        return firewall;
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.httpFirewall(allowUrlEncodedDoubleSlashHttpFirewall());
    }

//    public final AuthenticationEntryPoint unauthorizedEntryPoint = (request, response, authException) -> {
//        response.sendRedirect("/user/login");
//        //response.sendRedirect("/login/login"); // 권한 없을시 보낼 url
//    };
//
//    public final AccessDeniedHandler accessDeniedHandler = (request, response, accessDeniedException) -> {
//        response.sendRedirect("/user/login");
//        //response.sendRedirect("/login/login"); // 권한 없을시 보낼 url
//    };


}