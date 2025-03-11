package com.example.coding.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="user")
public class AdminUserJpaVO {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "user_id")
    private String userId;       // 아이디


    @Column(name = "user_name")
    private String userName;        // 이름

    @Column(name = "user_pass")
    private String userPass ;   // 비밀 번호

    @Column(name = "user_tel")
    private String userTel ;  // 전화 번호

    @Column(name = "user_email")
    private String userEmail;  // 이메일
    
    @Column(name = "user_addr")
    private String userAddr;  // 주소

    @Column(name = "user_gender")
    private String userGender ;   // 성별

    @Column(name = "user_age")
    private String userAge  ;       // 나이
    
    @Column(name = "user_prefer_type1")
    private String userPreferType1;    // 선호 여행 유형1

    @Column(name = "user_prefer_type2")
    private String userPreferType2 ; // 선호 여행 유형2

    @Column(name = "user_prefer_type3")
    private String userPreferType3 ;      // 선호 여행 유형3
    
    @Column(name = "user_prefer_loc1")
    private String userPreferLoc1;      // 선호 지역1
    

    @Column(name = "user_prefer_loc2")
    private String userPreferLoc2;      // 선호 지역2

    @Column(name = "user_prefer_loc3")
    private String userPreferLoc3;      // 선호 지역3

    @Column(name = "admin_authority")
    private Integer adminAuthority;      // 관리자 권한 여부

    @Column(name = "user_login_authority")
    private Integer userLoginAuthority;      // 로그인 여부

    @Column(name = "user_register_date")
    private Date userRegisterDate;      // 회원 가입 날짜 

    @Column(name = "user_delete_date")
    private Date userDeleteDate ;       // 탈퇴 날짜 

}
