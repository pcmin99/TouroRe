package com.example.coding.domain;


import lombok.Data;

@Data
public class AdminUserVO {



    private String userId ;
    private String userName ;
    private String userPass ;
    private String userTel ;
    private String userEmail ;
    private String userAddr ;
    private String userGender ;
    private Integer userAge ;
    private Integer adminAuthority;
    private Integer userLoginAuthority ;
    private String userRegisterDate ;
    private String userDeleteDate;
    private String imgRealName;

}
