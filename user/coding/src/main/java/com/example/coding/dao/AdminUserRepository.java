package com.example.coding.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.coding.domain.AdminUserJpaVO;

public interface AdminUserRepository  extends CrudRepository<AdminUserJpaVO, String>{
    
        @Query("SELECT u FROM AdminUserJpaVO u WHERE LOWER(u.userEmail) LIKE LOWER(CONCAT('%', :userSearch, '%')) OR LOWER(u.userName) LIKE LOWER(CONCAT('%', :userSearch, '%'))")
    	List<AdminUserJpaVO> findByUserSearchLike(String userSearch);
}
