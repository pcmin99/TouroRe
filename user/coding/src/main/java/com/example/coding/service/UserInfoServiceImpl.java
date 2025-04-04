package com.example.coding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.example.coding.dao.UserInfoDAO;
import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;

import java.util.concurrent.TimeUnit;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    
    @Autowired
    private UserInfoDAO userInfoDAO;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate ;

    private static final String CACHE_PREFIX  = System.getenv("redis_prefix");

    public UserVO getUserInfo(UserVO vo){

        return userInfoDAO.selectUser(vo);
    }

    @Override
    public UserProfileVO getProfile(UserProfileVO vo) {
            String cacheKey = CACHE_PREFIX + vo ;
            UserProfileVO cacheData = (UserProfileVO) redisTemplate.opsForValue().get(cacheKey);
            if(redisTemplate != null){
                return cacheData ;
            }

            // Redis 서버에 값이 없을 경우
            UserProfileVO result = userInfoDAO.getProfile(vo);
            redisTemplate.opsForValue().set(cacheKey, result, 10, TimeUnit.MINUTES);
            return result ;
    };
}
