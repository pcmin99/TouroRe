package com.example.coding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.example.coding.domain.GoogleVO;
import com.example.coding.domain.UserVO;
import com.example.coding.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
public class GoogleLoginController {

    @Autowired
    private UserService userService;

    // Google 로그인 설정
    private final String clientId = "1046875691637-lj4uq6p3ou9qdm1d3q2g33ag64emg04r.apps.googleusercontent.com";
    private final String clientSecret = "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";
    private final String redirectUri = "http://localhost:8080/user/googleCallBack";
    private final String googleTokenEndpoint = "https://oauth2.googleapis.com/token";
    private final String googleUserInfoEndpoint = "https://www.googleapis.com/oauth2/v1/userinfo";

    @GetMapping("/user/googleLogin")
    public String googleLogin() {
        String googleAuthUrl = "https://accounts.google.com/o/oauth2/auth?client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&response_type=code" +
                "&scope=openid%20profile%20email";
        return "redirect:" + googleAuthUrl;
    }

    @GetMapping("/user/googleCallBack")
    public String googleCallback(@RequestParam String code, Model model, HttpSession session) {
        // Google에서 받은 인증 코드로 토큰을 요청
        String tokenUrl = googleTokenEndpoint + "?code=" + code +
                "&client_id=" + clientId +
                "&client_secret=" + clientSecret +
                "&redirect_uri=" + redirectUri +
                "&grant_type=authorization_code";

        // RestTemplate을 사용하여 토큰 요청
        RestTemplate restTemplate = new RestTemplate();
        Map<String, Object> tokenResponse = restTemplate.postForObject(tokenUrl, null, Map.class);

        String accessToken = (String) tokenResponse.get("access_token");

        // 토큰을 이용하여 사용자 정보 요청
        String userInfoUrl = googleUserInfoEndpoint + "?access_token=" + accessToken;
        String userInfoResponse = restTemplate.getForObject(userInfoUrl, String.class);
        System.out.println("콜백 컨트롤러 : " + userInfoResponse);

        // ObjectMapper를 사용하여 JSON 문자열을 자바 객체로 매핑
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            GoogleVO googleUserInfo = objectMapper.readValue(userInfoResponse, GoogleVO.class);
            System.out.println("매핑한 사용자 정보 : " + googleUserInfo);

            // 사용자 정보에서 id 값을 추출
            String userId = googleUserInfo.getId();
            System.out.println("사용자 아이디 : " + "google_" + userId);

            // DB에서 사용자 정보 대조
            UserVO userVO = userService.socialLoginCheck("google_" + userId);

            // 사용자 정보가 DB에 없으면 회원가입 페이지로 이동
            if (userVO == null) {
                // 사용자 정보를 Model에 담아서 social-sign-up 페이지로 전달
                model.addAttribute("googleUserInfo", googleUserInfo);
                return "user/google-sign-up";
            }

            // 사용자 정보를 세션에 저장
            session.setAttribute("loggedInUser", userVO);
            System.out.println("userVO: " + userVO);
            // // 아이디 세션이 필요해서 추가합니다 - 이지연
            // session.setAttribute("loggedId", userVO.getUser_id());

        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/errorPage";
        }
        return "redirect:/touro";
    }

    @GetMapping("/user/google-sign-up")
    public String socialSignUpPage(@RequestParam("googleUserInfo") String googleUserInfo, Model model) {
        // 사용자 정보 활용
        System.out.println("넘겨받은 googleUserInfo 값: " + googleUserInfo.toString());
        model.addAttribute("googleUserInfo", googleUserInfo);
        System.out.println("모델 컨트롤러 : " + googleUserInfo);

        return "user/google-sign-up";
    }
}
