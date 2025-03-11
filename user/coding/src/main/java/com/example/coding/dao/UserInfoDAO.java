package com.example.coding.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;

@Mapper
public interface UserInfoDAO{
    
    public UserVO selectUser(UserVO vo);
    public UserProfileVO getProfile(UserProfileVO vo);
}
