package com.example.coding.domain;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class NaverVO {

    @JsonProperty("access_token")
    private String access_token;

    @JsonProperty("token_type")
    private String token_type;

    @JsonProperty("refresh_token")
    private String refresh_token;

    @JsonProperty("expires_in")
    private Long expires_in;

    @JsonProperty("scope")
    private String scope;

    @JsonProperty("error")
    private String error;

    @JsonProperty("error_description")
    private String error_description;
    
    // 사용자 정보를 담을 필드 추가
    @JsonProperty("resultcode")
    private String resultcode;

    @JsonProperty("message")
    private String message;

    @JsonProperty("response")
    private Map<String, Object> response;
}
