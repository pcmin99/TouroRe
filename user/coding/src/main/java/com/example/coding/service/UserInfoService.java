package com.example.coding.service;

import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;

public interface UserInfoService {
    
    public UserVO getUserInfo(UserVO vo);
    public UserProfileVO getProfile(UserProfileVO vo);
}
