package com.example.coding.domain;

import com.fasterxml.jackson.annotation.JsonProperty;

public class NaverTokenResponse {

    @JsonProperty("access_token")
    private String access_token;

    @JsonProperty("token_type")
    private String token_type;
    
    public String getAccess_token() {
        return access_token;
    }
}
