package com.example.coding.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;


import com.example.coding.domain.NaverVO;
import com.example.coding.domain.UserVO;
import com.example.coding.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;


@Controller
public class NaverLoginController {

    @Autowired
    private UserService userService;

    // 네이버 로그인
    private final String clientId = "ieY9ziYjv1wBfONtq6FJ";
    private final String clientSecret = "rUhrtJkBHJ";
    private final String redirectUri = "http://localhost:8080/user/naverCallBack";
    private final String naverTokenEndpoint = "https://nid.naver.com/oauth2.0/token";
    private final String naverUserInfoEndpoint = "https://openapi.naver.com/v1/nid/me";

    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("user/naverLogin")
    public String naverLogin() {
        String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize?client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&response_type=code";
        return "redirect:" + naverAuthUrl;
    }

    @GetMapping("user/naverCallBack")
    public String naverCallback(@RequestParam String code, Model m, HttpSession session) {
        // 네이버에서 받은 인증 코드로 토큰을 요청
        String tokenUrl = naverTokenEndpoint + "?grant_type=authorization_code" +
                        "&client_id=" + clientId +
                        "&client_secret=" + clientSecret +
                        "&redirect_uri=" + redirectUri +
                        "&code=" + code;

        // RestTemplate을 사용하여 토큰 요청
        RestTemplate restTemplate = new RestTemplate();
        NaverVO vo = restTemplate.postForObject(tokenUrl, null, NaverVO.class);

        // 토큰을 이용하여 사용자 정보 요청
        String userInfoUrl = naverUserInfoEndpoint;
        String userInfoResponse = restTemplate.getForObject(userInfoUrl + "?access_token=" + vo.getAccess_token(), String.class);
        System.out.println("콜백 컨트롤러 : " + userInfoResponse);

        // ObjectMapper를 사용하여 JSON 문자열을 자바 객체로 매핑
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            NaverVO naverInfo = objectMapper.readValue(userInfoResponse, NaverVO.class);
            System.out.println("매핑한 사용자 정보 : " + naverInfo);

            // 사용자 정보에서 id 값을 추출
            String user_id = (String) naverInfo.getResponse().get("id");
            System.out.println("사용자 아이디 : " + "naver_"+ user_id);

            // DB에서 사용자 정보 대조
            UserVO userVO = userService.socialLoginCheck("naver_"+user_id);

            // 사용자 정보가 DB에 없으면 회원가입 페이지로 이동
            if (userVO == null) {
                // 사용자 정보를 Model에 담아서 social-sign-up페이지로 전달
                m.addAttribute("naverUserInfo", userInfoResponse);
                return "user/naver-sign-up";
            }

            // 사용자 정보를 세션에 저장
            session.setAttribute("loggedInUser", userVO);
            System.out.println("userVO : " + userVO);
            // 아이디 세션이 필요해서 추가합니다 - 이지연
            session.setAttribute("loggedId", userVO.getUser_id());

        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/errorPage";
        }
        return "redirect:/touro";
    }

    @GetMapping("/user/naver-sign-up")
    public String socialSignUpPage(@ModelAttribute("naverUserInfo") String naverUserInfo, Model model) {
        // 사용자 정보 활용
        System.out.println(naverUserInfo);
        model.addAttribute("naverUserInfo", naverUserInfo);
        System.out.println("모델 컨트롤러 : " + naverUserInfo);

        return "user/naver-sign-up"; // 적절한 페이지로 수정
    }

}

