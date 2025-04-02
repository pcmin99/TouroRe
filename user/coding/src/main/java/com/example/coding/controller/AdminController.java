package com.example.coding.controller;

import java.util.List;

import com.example.coding.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.example.coding.service.AdminService;

import io.swagger.v3.oas.annotations.tags.Tag;
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
    public List<AdminTourVO> tourList(Model m) {
        List<AdminTourVO> list = adminService.tourList();
        m.addAttribute("tourList", list);
        return list;
    }

    // 여행지 목록 페이지 내부에 search 값 리스트 띄우는 컨트롤러 (JPA)
    @GetMapping("/search_tourName")
    public List<AdminTourJpaVO> search_tourName(@RequestParam("search_tourName") String search_tourName) {
        return repo.findByTourNameLike("%" + search_tourName + "%");
    }


    // touroview ( 후기 게시판 ) 리스트 출력
    @GetMapping("/touroview-list/touroviewList")
    public List<AdminTouroViewList> touroviewList(Model m) {
        List<AdminTouroViewList> viewLists = adminService.touroviewList();
        m.addAttribute("touroviewList", viewLists);
        return viewLists;
    }

    // 후기 게시판 리스트 내부에서 검색
    @GetMapping("/touroview-list/search_touro")
    public List<AdminSearchTouro> search_touro (@RequestParam String search_touro ){
        return adminService.search_touro(search_touro);
    }

    // 여행지 디테일 페이지
    @GetMapping("/tour-view/{tourNum}")
    public AdminTourDetailVO TourDetail(@PathVariable("tourNum") String tourNum) {
        AdminTourDetailVO vo = new AdminTourDetailVO();
        vo.setTourNum(tourNum);
        AdminTourDetailVO result = adminService.tourdetail(vo);
        result.setTourNum(tourNum);
        return result;
    }

    // 리스트에서 여행지 삭제
    @DeleteMapping("/tour-list/{tourNum}")
    public void deleteNum(@PathVariable String tourNum) {
        AdminVO vo = new AdminVO();
        vo.setTour_num(tourNum);
        vo.setTourNum(tourNum);
        adminService.deleteNum(vo);
    }

    // 여행지 등록
    // Controller 에 있는 파일에 대한 비즈니스 로직 Service 단으로 옮김 
    //  RequestParam 값도 같이 Service단까지 던짐
    @PostMapping("/tour-register/tourInsert")
    public void tourInsert(AdminVO vo, @RequestParam("mutipartFile") MultipartFile mutipartFile) {
            adminService.tourInsert(vo, mutipartFile);
}


    // 어차피 List 값 서비스 단에 던진 후 리턴 받아서 모델이 붙이기에 로직 이동
    @GetMapping("/user/userList")
    public List<AdminUserVO> userList(Model m) {
        List<AdminUserVO> userlist = adminService.userList();
        m.addAttribute("userList", userlist);
        return userlist;
    }

    // 유저 목록 페이지 내부에 search 값 리스트 띄우는 컨트롤러 (JPA)
    @GetMapping("/user/userSearch")
    public List<AdminUserJpaVO> searchUsers(@RequestParam("userSearch") String userSearch) {
        return userRepo.findByUserSearchLike("%" + userSearch + "%");
    }



    // 후기 게시판 디테일 페이지 관련 
    @GetMapping("/tour-list/touroviewNum/{touroview_num}")
    public List<AdminVO> touroViewNum(@PathVariable("touroview_num") Integer touroview_num) {
        List<AdminVO> result = adminService.touroViewNum(touroview_num);
        return result;
    }

    // 여행지 상세에서 수정 (이미지 업로드 이야기 없기에 이미지 수정은 x)
    @PutMapping("/tour-view/modifyTour/{tourNum}")
    public void modifyTour (@PathVariable String tourNum , @RequestBody AdminVO tours) {
        tours.setTourNum(tourNum);     
        adminService.modifyTour(tours);
    }

    // 문의 게시글 (num, title,user_id, regdate,process)
    @GetMapping("/inquiry")
    public List<InquiryVO> inquiry(Model m) {
        List<InquiryVO> list = adminService.inquiry();
        m.addAttribute("inquiry", list);
        return list;
    }
    
}
