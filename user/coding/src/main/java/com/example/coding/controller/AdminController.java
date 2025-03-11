package com.example.coding.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.coding.dao.AdminRepository;
import com.example.coding.dao.AdminUserRepository;
import com.example.coding.domain.AdminTourJpaVO;
import com.example.coding.domain.AdminUserJpaVO;
import com.example.coding.domain.AdminVO;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.service.AdminService;
import com.example.coding.util.MD5Generator;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;



@RestController
@CrossOrigin(origins = "http://localhost:5173")
@Tag(name="AdminController", description="이 클래스에 대한 설명부분")
public class AdminController {
    
    @Autowired
    private AdminService adminService;

    @Autowired
	private AdminRepository repo ; 

    @Autowired
	private AdminUserRepository userRepo ; 


    // 전체 여행지 리스트 띄우는 컨트롤러 (My batis)
    @GetMapping("/tour-list")
    public List<AdminVO> tourList(Model m) {
        List<AdminVO> list = adminService.tourList();
        m.addAttribute("tourList", list);
        return list;
    }

    // 여행지 목록 페이지 내부에 search 값 리스트 띄우는 컨트롤러 (JPA)
    @GetMapping("/search_tourName")
    public List<AdminTourJpaVO> search_tourName(@RequestParam("search_tourName") String search_tourName) {
        System.out.println("검색어: " + search_tourName);
        return repo.findByTourNameLike("%" + search_tourName + "%");
    }

    // 후기 게시판 리스트 내부에서 검색
    @GetMapping("/touroview-list/search_touro")
    public List<AdminVO> search_touro (@RequestParam("search_touro")String search_touro ){
        System.out.println("리스트 내부에서 검색");
        System.out.println(search_touro); 
        return adminService.search_touro(search_touro);
    };

    // 여행지 디테일 페이지
    @GetMapping("/tour-view/{tourNum}")
    public AdminVO TourDetail(@PathVariable("tourNum") String tourNum) {
        AdminVO vo = new AdminVO();
        vo.setTourNum(tourNum);
        AdminVO result = adminService.tourdetail(vo);
        result.setTourNum(tourNum);
        return result;
    }

    // 리스트에서 여행지 삭제
    @DeleteMapping("/tour-list/{tourNum}")
    public void deleteNum(@PathVariable String tourNum) {
        AdminVO vo = new AdminVO();
        vo.setTour_num(tourNum);
        vo.setTourNum(tourNum);
        // System.out.println(vo);
        adminService.deleteNum(vo);
    }

    // 여행지 등록 
    @PostMapping("/tour-register/tourInsert")
    public void tourInsert(AdminVO vo, @RequestParam("mutipartFile") MultipartFile mutipartFile) {

        try {
            String img_name = mutipartFile.getOriginalFilename();
            System.out.println("originFilename : " + img_name);
            String img_real_name = new MD5Generator(img_name).toString();

            // 시스템으로 자동으로 잡아주는 경로 설정
            // 생성되는 폴더의 위치를 확인 후 추후 변경
            // => static 폴더 밑으로 이동해야 사용자가 그 파일에 접근 가능
            String save_path = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\tourimg";
            if( !new File(save_path).exists() ){
                new File(save_path).mkdir();
            } 
            String img_path = save_path + "\\" + img_real_name;
            System.out.println("filepath : " + img_path);

            // 파일저장
            mutipartFile.transferTo(new File(img_path));
            
            // 디비저장을 위해서 파일정보 덩어리 만들기
            vo.setTour_img1_path("tourimg\\" + img_real_name);
            System.out.println("<<<<< 파일정보 덩어리 만들기 성공 >>>>>");
            adminService.tourInsert(vo);
        }catch(Exception ex){
            ex.printStackTrace();
            System.out.println("파일업로드 실패 : " + ex.getMessage());
        }
}

    
    // 전체 회원 전체 리스트 띄우는 컨트롤러 (My batis)
    @GetMapping("/user/userList")
    public List<AdminVO> userList(Model m) {
        List<AdminVO> userlist = adminService.userList();
        // System.out.println(userlist);
        for(AdminVO user : userlist){
            if(user.getImgRealName() != null) {
                String path = "../../../../user/coding/src/main/resources/static/assets/images/profile/";
                String realName = user.getImgRealName();
                // FileSystemResource resource = new FileSystemResource(path + realName);
                // user.setImgRealName(resource);
            }
        }
        m.addAttribute("userList", userlist);
        return userlist;
    }

    // 유저 목록 페이지 내부에 search 값 리스트 띄우는 컨트롤러 (JPA)
    @GetMapping("/user/userSearch")
    public List<AdminUserJpaVO> searchUsers(@RequestParam("userSearch") String userSearch, Model m) {
        return userRepo.findByUserSearchLike("%" + userSearch + "%");
    }


    // touroview ( 후기 게시판 ) 리스트 출력
    @GetMapping("/touroview-list/touroviewList")
    public List<AdminVO> touroviewList(Model m) {
        List<AdminVO> viewLists = adminService.touroviewList();
        m.addAttribute("touroviewList", viewLists);
        return viewLists;
    }

    // 후기 게시판 디테일 페이지 관련 
    @GetMapping("/tour-list/touroviewNum/{touroview_num}")
    public List<AdminVO> touroViewNum(@PathVariable("touroview_num") Integer touroview_num) {
        // System.out.println("넘" + touroview_num);
        // AdminVO vo = new AdminVO();
        // vo.setTouroview_num(touroview_num);
        List<AdminVO> result = adminService.touroViewNum(touroview_num);
        // System.out.println("왜 안되니?" + result);
        // result.setTouroview_num(touroview_num);
        return result;
    }

    // 여행지 상세에서 수정 (이미지 업로드 이야기 없기에 이미지 수정은 x)
    @PutMapping("/tour-view/modifyTour/{tourNum}")
    public void modifyTour (@PathVariable String tourNum , @RequestBody AdminVO tours) {
        tours.setTourNum(tourNum);     
        adminService.modifyTour(tours);

    }

    // 문의 게시글
    @GetMapping("/inquiry")
    public List<AdminVO> inquiry(Model m) {
        List<AdminVO> list = adminService.inquiry();
        System.out.println(list);
        m.addAttribute("inquiry", list);
        return list;
    }
    
}
