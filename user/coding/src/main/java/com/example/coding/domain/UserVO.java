package com.example.coding.domain;

import lombok.Data;

@Data
public class UserVO {

    private String  user_id;                // 아이디
    private String  user_name;              // 이름
    private String  user_pass;              // 비밀번호
    private String  user_tel;               // 전화번호
    private String  user_email;             // 메일
    private String  user_addr;              // 주소
    private String  user_gender;            // 성별
    private String  user_age;               // 나이

    private String  user_prefer_type1;      // 선호 여행취향 1순위
    private String  user_prefer_type2;      // 선호 여행취향 2순위
    private String  user_prefer_type3;      // 선호 여행취향 3순위
    private String  user_prefer_loc1;       // 선호 지역 1순위
    private String  user_prefer_loc2;       // 선호 지역 2순위
    private String  user_prefer_loc3;       // 선호 지역 3순위
    
    private int     admin_authority;        // 관리자 권한 여부
    private int     user_login_authority;   // 로그인 여부

    private String  user_register_date;     // 회원 가입일
    private String  user_delete_date;       // 회원 탈퇴일

    private Long    img_detail_num;         // 이미지구분 번호
    private Long    img_num;                // 이미지 번호
    private String  img_real_name;          // 이미지 이름

    // 네이버 토큰 관련 필드 추가
    private String  naver_access_token;
    private String  naver_token_type;
    private String  naver_refresh_token;
    private Long    naver_expires_in;
    private String  naver_scope;
    

    
}
