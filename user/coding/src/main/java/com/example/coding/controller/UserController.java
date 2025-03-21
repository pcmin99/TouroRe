package com.example.coding.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.example.coding.domain.UserVO;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.service.ImgService;
import com.example.coding.service.UserService;
import com.example.coding.util.MD5Generator;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    
	@Autowired
	private UserService userService;

    @Autowired
	private ImgService imgService;

	@Autowired
	private JavaMailSender mailSender;

	// 회원가입
	@RequestMapping("/insertUser") 
	public String insertUser(@RequestParam(name = "file", required = false) MultipartFile file, UserVO vo) {
		try {
            String defaultProfileImagePath = "static/assets/images/profile/default_profile.png";
        
            // 파일첨부가 있는 경우
            if( file != null && !file.isEmpty() ){
                String img_name = file.getOriginalFilename();
                String img_real_name = new MD5Generator(img_name).toString();
                String save_path = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\assets\\images\\profile";
                if( !new File(save_path).exists() ){
                    new File(save_path).mkdir();
                } 
                String img_path = save_path + "\\" + img_real_name;
                file.transferTo(new File(img_path));
                ImgVO ivo = new ImgVO();
								ivo.setImg_name(img_name);
                ivo.setImg_real_name(img_real_name);
                ivo.setImg_path(img_path);

                // 파일정보 img_detail에 담기
                ImgDetailVO idvo = new ImgDetailVO();
                idvo.setUser_id(vo.getUser_id());
                idvo.setImg_num(imgService.selectNum());

                // 디비저장 시 파일정보 덩어리 추가
				userService.insertUser(vo, ivo, idvo);
            }else {
                // 파일첨부가 없는 경우
                // 기본 이미지를 업로드할 수 있도록 경로 설정
                String defaultImg_real_name = new MD5Generator(defaultProfileImagePath).toString();
                String save_path = System.getProperty("user.dir") + "\\src\\main\\resources\\";
                String img_path = save_path + defaultProfileImagePath;

                // 기본 이미지 저장
                InputStream defaultImageStream = getClass().getClassLoader().getResourceAsStream(defaultProfileImagePath);
                Files.copy(defaultImageStream, Paths.get(img_path), StandardCopyOption.REPLACE_EXISTING);

                // 디비저장을 위해서 파일정보 덩어리 만들기
                ImgVO ivo = new ImgVO();
                ivo.setImg_name("default_profile.png");
                ivo.setImg_real_name(defaultImg_real_name);
                ivo.setImg_path(img_path);

                // 파일정보 img_detail에 담기
                ImgDetailVO idvo = new ImgDetailVO();
                idvo.setUser_id(vo.getUser_id());
                idvo.setImg_num(imgService.selectNum());
    
                // 디비저장 시 파일정보 덩어리 추가
                userService.insertUser(vo, ivo, idvo);
            }
			return "redirect:login";
        }catch(Exception ex){
            ex.printStackTrace();
            return "redirect:/errorPage"; // 실패 시 처리할 페이지로 리다이렉트
        }
		
	}

	// id 중복체크
	@RequestMapping("/idCheck") 
	@ResponseBody
	public String idCheck(String user_id) {
		int result = userService.idCheck(user_id);
		return "" + result;
	}

    @RequestMapping("/loginCheck")
    public String loginCheck(UserVO vo, HttpSession s){
        
        // DB에서 사용자 정보 대조
        vo = userService.loginCheck(vo);
        System.out.println("login() 호출 =====> vo: "+vo);

        // 사용자 정보 확인 시 (로그인 성공 시)
        if( vo != null ){
            // 사용자 정보를 세션에 저장
            s.setAttribute("loggedInUser", vo);
            // 아이디 세션이 필요해서 추가합니다 - 이지연
            s.setAttribute("loggedId", vo.getUser_id());
			// 이름 세션이 필요해서 추가합니다 - 이지연
            s.setAttribute("loggedInName", vo.getUser_name());
            // 사용자 정보 중 관리자 권한 여부 확인
            int role = vo.getAdmin_authority();
            // 관리자 권한 여부가 1이면 사용자 페이지(메인페이지)로 이동
            if( role == 1 ){
                return "redirect:/touro";
            }else if( role == 0 ){
                // 관리자 권한 여부가 0이면 관리자 페이지로 이동
                return "redirect:http://localhost:5173/";
            }
        }
        // 로그인 실패 시 알림페이지로 이동
        return "user/login_failed";
    }

  @RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션을 제거하여 로그아웃 처리
		session.invalidate();

		// 로그아웃 후 리다이렉트
		return "redirect:/touro";
	}

	// 아이디 찾기
	@RequestMapping(value = "find-id", method = RequestMethod.POST)
	public ModelAndView findID(String user_email){
		// 입력받은 이메일로 사용자 아이디 받아오기
		List<String> user_id = userService.findUserid(user_email);
		System.out.println(user_id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("user/find-id-result");
		mv.addObject("user_id", user_id);
		return mv;
	}

    // 비밀번호 찾기 - 인증메일발송
	@RequestMapping(value = "/find-pw", method = RequestMethod.POST)
	public ModelAndView forgotPassword(HttpSession session, 
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String user_email = (String)request.getParameter("user_email");
		String user_id = (String)request.getParameter("user_id");
		UserVO vo = userService.selectUser(user_email,user_id);
		System.out.println("====사용자정보 확인 성공==="+vo);

		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
			// 입력한 메일주소,아이디가 사용자 정보와 동일할 경우
			if (vo.getUser_email().equals(user_email) && vo.getUser_id().equals(user_id)) {
				session.setAttribute("user_email", vo.getUser_email());

				String setfrom = "TOURO@gmail.com"; // gmail 
				String tomail = user_email; //받는사람
				String title = "[TOURO] 비밀번호변경 인증 이메일 입니다"; 
				String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
						+ "TOURO 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
				System.out.println(content);

				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 

					// 인증메일 발송
					mailSender.send(message);
					System.out.println("===== 메일 발송 성공! =====");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

				// 인증 메일 발송 후 인증번호 모델에 담아서 인증번호 입력 페이지로 이동
				ModelAndView mv = new ModelAndView();
				mv.setViewName("user/auth-num");
				mv.addObject("num", num);
				
				// 비밀번호 초기화 시 사용자 아이디 값을 넘기기 위해 UserVO 객체를 ModelAndView에 추가
				mv.addObject("user", vo);
				// UserVO 객체를 세션에 설정
				session.setAttribute("user", vo);
				return mv;

				}else {
					ModelAndView mv = new ModelAndView();
					mv.setViewName("user/find-pw");
					return mv;
				}
			}else {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("user/find-pw");
				return mv;
			}
	
}
	
	// 인증번호 확인
	@RequestMapping(value = "/auth-pw", method = RequestMethod.POST)
	public String authNum(@RequestParam(value="email_auth") String email_auth, @RequestParam(value = "num") String num, HttpSession session) throws IOException{
			//인증번호가 일치하면 비밀번호 변경 페이지로 이동
			if(email_auth.equals(num)) {
				UserVO vo = (UserVO) session.getAttribute("user");
				session.setAttribute("user_id", vo.getUser_id());
				return "user/modify-pw";
			}
			else {
				// 인증번호가 불일치 시 알림페이지로 이동
				return "user/auth-failed";
			}
	}
	
	// 새 비밀번호 설정
	@RequestMapping(value = "/modify-pw", method = RequestMethod.POST)
	public String modifyPassword(UserVO vo, HttpSession session) throws IOException{
		// 세션에서 user_id 값을 가져옴
		String user_id = (String) session.getAttribute("user_id");
		// 가져온 user_id를 vo에 설정
		vo.setUser_id(user_id);
		
		int result = userService.modifyPassword(vo);
		System.out.println(result);

		// 비밀번호 변경 성공하면 로그인 페이지로 이동
		if(result != 0) {
			return "user/login";
		}
		else {
			System.out.println("비밀번호 변경 실패");
			return "user/modify-pw";
		}
	}
}
