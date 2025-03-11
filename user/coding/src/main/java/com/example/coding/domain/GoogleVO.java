package com.example.coding.domain;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class GoogleVO {

    @JsonProperty("id")
    private String id;

    @JsonProperty("email")
    private String email;

    @JsonProperty("name")
    private String name;

    @JsonProperty("given_name")
    private String givenName;

    @JsonProperty("family_name")
    private String familyName;

    @JsonProperty("picture")
    private String picture;

    @JsonProperty("birthday")
    private String birthday;

    @JsonProperty("locale")
    private String locale;

    @JsonProperty("hd")
    private String hostedDomain;

    @JsonProperty("gender")
    private String gender;

    @JsonProperty("verified_email")
    private Boolean verifiedEmail;

    @JsonProperty("link")
    private String profileLink;

    @JsonProperty("expires_in")
    private Long expiresIn;

    @JsonProperty("access_token")
    private String accessToken;

    @JsonProperty("token_type")
    private String tokenType;

    @JsonProperty("refresh_token")
    private String refreshToken;

    // 동적인 사용자 정보를 담기 위한 Map
    @JsonProperty("extra_info")
    private Map<String, Object> extraInfo;
}
