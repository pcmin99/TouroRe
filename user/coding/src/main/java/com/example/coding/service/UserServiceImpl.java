package com.example.coding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.coding.dao.UserDAO;
import com.example.coding.dao.ImgDetailDAO;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
	private UserDAO userDAO;

	@Autowired
	private ImgDetailDAO imgDetailDAO;

	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();


	@Transactional
	public void insertUser(UserVO vo, ImgVO ivo, ImgDetailVO idvo) {
		// 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(vo.getUser_pass());

		vo.setUser_pass(encodedPassword);

		// 파일첨부가 있는 경우
		if( ivo != null ){
			
			// DB에 사용자 정보 입력
			userDAO.insertUser(vo);
			// ImgDetail 테이블에 정보 입력
			imgDetailDAO.insertFile(idvo);

		}else{
			userDAO.insertUser(vo);
		}
		
	}

	@Override
	public int idCheck(String user_id) {
		int result = userDAO.idCheck(user_id);
		return result;
	}

	@Override
	@Transactional
	public UserVO loginCheck(UserVO vo) {
		// 사용자 아이디를 이용하여 DB에서 저장된 암호화된 비밀번호 가져오기
		UserVO user = userDAO.passCheck(vo);

		if (user != null) {
			// 데이터베이스에 저장된 암호화된 비밀번호
			String bcryptPassword = user.getUser_pass();
			
			// 사용자가 입력한 비밀번호
			String inputPassword = vo.getUser_pass();

			// BCryptPasswordEncoder.matches()를 사용하여 비밀번호 대조
			if (passwordEncoder.matches(inputPassword, bcryptPassword)) {
				// 비밀번호가 일치하면 사용자 정보 반환
				return user;
			}
		}
	
		// 사용자 정보가 없거나 비밀번호가 일치하지 않으면 null 반환
		return null;
	}

	@Override
	public UserVO socialLoginCheck(String user_id) {

		return userDAO.socialLoginCheck(user_id);
	}

	@Override
	public List<String> findUserid(String user_email) {

		return userDAO.findUserid(user_email);
	}

	@Override
	public UserVO selectUser(String user_email,String user_id) {
		UserVO result = userDAO.selectUser(user_email,user_id);
		return result;
	}

	@Override
	@Transactional
	public int modifyPassword(UserVO vo) {
		// 비밀번호 암호화
        String encodedPassword = passwordEncoder.encode(vo.getUser_pass());
		vo.setUser_pass(encodedPassword);

		int result = userDAO.modifyPassword(vo);
		return result;
	}
}
