package com.example.coding.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.coding.domain.AdminTourJpaVO;


public interface AdminRepository extends CrudRepository<AdminTourJpaVO, String>{
	
	List<AdminTourJpaVO> findByTourNameLike(String tourName);
	
	
}