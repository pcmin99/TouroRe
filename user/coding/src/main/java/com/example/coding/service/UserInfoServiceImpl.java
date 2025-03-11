package com.example.coding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.coding.dao.UserInfoDAO;
import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    
    @Autowired
    private UserInfoDAO userInfoDAO;

    public UserVO getUserInfo(UserVO vo){
        return userInfoDAO.selectUser(vo);
    }

    @Override
    public UserProfileVO getProfile(UserProfileVO vo) {
        return userInfoDAO.getProfile(vo);
    };
}
