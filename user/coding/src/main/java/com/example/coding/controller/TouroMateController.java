package com.example.coding.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;
import com.example.coding.domain.WishListVO;
import com.example.coding.service.ImgService;
import com.example.coding.service.TouroMateService;
import com.example.coding.util.MD5Generator;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/touromate")
public class TouroMateController {

    private final TouroMateService mateService;

    public TouroMateController(TouroMateService mateService){
        this.mateService = mateService;
    }
    
    @Autowired
    public ImgService imgService;


    // 노드 서버
    private final int nodeServerPort = 8081;

    @RequestMapping("/touromate_list")
    // '@RequestParam'를 사용하여, URL에서 파라미터를 읽어옴. name = "searchKeyword" 파라미터의 이름 정의, 'required = false' 이 파라미터는 필수가 아님 -> 검색어가 없는 경우에도 메서드 실행 가능
    public String list(@RequestParam(name = "searchKeyword", required = false) String searchKeyword,
                       @RequestParam(name = "page", defaultValue = "1") int page, Model m, HttpServletRequest request) {
        // 세션에서 user_id 가져오기
        HttpSession session = request.getSession();
        UserVO loggedInUser = (UserVO) session.getAttribute("loggedInUser");

        
        // 전체 페이지 수를 가져오는 메서드
        int getTotalPages = mateService.getTotalPages();

        // 검색어에 해당하는 게시글 리스트 메서드
        List<TouroMateVO> selectedMateList;

        if (StringUtils.hasText(searchKeyword)) {
            // 검색어가 있을 경우 실행 -> 조건에 맞는 게시글을 가져옴
            selectedMateList = mateService.searchMateList(searchKeyword, page);
        } else {
            selectedMateList = mateService.getSelectedMateList(page);
        }

        m.addAttribute("touromates", selectedMateList);
        m.addAttribute("totalPages", getTotalPages);
        m.addAttribute("currentPage", page);
        m.addAttribute("loggedInUserId", loggedInUser != null ? loggedInUser.getUser_id() : null);

        return "touromate/touromate_list";
    }

    // insert 페이지
    @PostMapping("/register-course")
    public String registerCourse(@ModelAttribute TouroMateVO touroMateVO, 
                                HttpServletRequest request, @RequestParam(name="files", required = false) MultipartFile[] files){

        mateService.registerTouroMateAndChat(touroMateVO, request);
        mateService.joinChat(touroMateVO.getUser_id(), touroMateVO.getTouro_mate_num(), null); // 아직 안건듬
        imgService.insertFile(files);
        return "redirect:/touromate/touromate_list";

    }

    //detail 페이지
    @RequestMapping("/touromate_detail")
    public void showDetailPage(@RequestParam int touro_mate_num, Model m){

        // 해당 게시글의 정보 가져옴
        TouroMateVO touroMate = mateService.getTouroMateById(touro_mate_num);
        // 해당 게시글의 여행지 정보를 가져옴
        List<TouroMateVO> travelPlaces = mateService.getTravelPlaces(touro_mate_num);
        // 해당 게시글의 작성자 정보를 가져옴
        UserVO authorInfo = mateService.getAuthorInfo(touroMate.getUser_id());
        List<ImgVO> imgList = mateService.getImages(touro_mate_num);
        int remainingUsers = mateService.getRemainingChatUsers(touro_mate_num);
        // 랜덤 여행지 - 3개
        List<Touro> randTour = mateService.getRandTour();

        m.addAttribute("touroMate", touroMate);
        m.addAttribute("travelPlaces", travelPlaces);
        m.addAttribute("authorInfo", authorInfo);
        m.addAttribute("mateimgList", imgList);
        m.addAttribute("remainingUsers", remainingUsers);
        m.addAttribute("randTour", randTour);
    }

    // 채팅 버튼 클릭 시 tour_mate_chat_user 테이블 저장
    @PostMapping("/joinChat")
    @ResponseBody
    public String joinChat(@RequestParam int touro_mate_num, HttpServletRequest request ) {

        HttpSession session = request.getSession();
        UserVO loggedInUser = (UserVO) session.getAttribute("loggedInUser");
        return mateService.joinChat(loggedInUser.getUser_id(), touro_mate_num, null);


    }

    // 사용자 프로필 가져와서 채팅에 붙이기
    @RequestMapping(value = "/getprofileImg", method={RequestMethod.POST})
   @ResponseBody
   public String requestMethodName(UserProfileVO vo) {
      vo = mateService.getProfile(vo);
      String img_real_name = vo.getImg_real_name();
      try {
            if (vo.getImg_real_name() != null && vo.getImg_real_name() != "" && !img_real_name.equals("5ee25b671da2a46f118d0a4454d822a5")){
                return img_real_name;
            }else
                return "NO";
      } catch (Exception e) {
         return "default_profile.png";
      }
   }

    // 게시글 삭제
    @PostMapping("/deleteTouroMate")
    public void deleteTouroMate(TouroMateVO vo, HttpServletRequest request, HttpSession session) {
        mateService.deleteTouroMate(vo,request);
    }

    // 좋아요 추가
    @PostMapping("/addWishListmate")
    @ResponseBody
   public void addWishList(@ModelAttribute("vo") LikeVO vo){
        mateService.addWishListmate(vo);
   }

    // 좋아요 확인
    @PostMapping("/ckWishListmate")
    @ResponseBody
   public int ckWishList(@ModelAttribute("vo") LikeVO vo){
      return mateService.ckWishListmate(vo);
   }

    // 좋아요 삭제
    @PostMapping("/deleteWishListmate")
    @ResponseBody
   public void deleteWishList(@ModelAttribute("vo") LikeVO vo){
      mateService.deleteWishListmate(vo);

   }

}