package com.example.coding.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.coding.domain.UserVO;

@Mapper
public interface UserDAO {
    public void insertUser(UserVO vo);
    public int idCheck(String user_id);
    public UserVO loginCheck(UserVO vo);
    public UserVO passCheck(UserVO vo);
    public UserVO socialLoginCheck(String user_id);
    public List<String> findUserid(String user_email);
    public UserVO selectUser(String user_email,String user_id);
    public int modifyPassword(UserVO vo);
}