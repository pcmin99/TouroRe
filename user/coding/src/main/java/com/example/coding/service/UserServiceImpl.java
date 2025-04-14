package com.example.coding.service;

import java.util.List;
import java.util.concurrent.TimeUnit;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.coding.dao.UserDAO;
import com.example.coding.dao.ImgDetailDAO;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.UserVO;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Autowired
	private UserDAO userDAO;

	@Autowired
	private ImgDetailDAO imgDetailDAO;

	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Autowired
	private RedissonClient redissonClient ;

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
	public UserVO loginCheck(UserVO vo, HttpSession s) {
		String userId = vo.getUser_id() ;
		RLock lock = redissonClient.getLock("loginLock:" + userId);
		try{
			if(!lock.tryLock(2,5, TimeUnit.SECONDS)){
				return null ;
			}
			UserVO user = userDAO.passCheck(vo);
			if(user == null){return  null; }
			String bcryptPassword = user.getUser_pass();
			String inputPassword = vo.getUser_pass();
			if (!passwordEncoder.matches(inputPassword, bcryptPassword)) {
				return null ;
			}
			s.setAttribute("loggedInUser", user);
			s.setAttribute("loggedId", user.getUser_id());
			s.setAttribute("loggedInName", user.getUser_name());
			return user ;
		} catch (Exception e) {
			log.error("loginCheck ERROR :" ,e);
			throw new RuntimeException(e);
		}finally {
			if (lock.isHeldByCurrentThread()) {
				lock.unlock();
			}
		}
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
