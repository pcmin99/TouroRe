package com.example.coding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.coding.domain.AdminTouroMateVO;
import com.example.coding.domain.AdminVO;
import com.example.coding.domain.ChartVO;
import com.example.coding.domain.MainAdminVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.service.MainService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@RestController
@CrossOrigin(origins = "http://localhost:5173")
public class MainAdminController {

  @Autowired
  MainService mainService;


  // 관리자 touromate 리스트 출력
  @GetMapping("/touromate-list/touromateList")
  public List<AdminTouroMateVO> touromateList(Model m) {
      List<AdminTouroMateVO> mateLists = mainService.touromateList();
      m.addAttribute("touromateList", mateLists);
      return mateLists;
  }

  // 관리자 touromate 검색
  @GetMapping("/touromate-list/search_mate")
  public List<AdminTouroMateVO> searchMate(@RequestParam("search_mate")String search_mate ) {
      return mainService.searchMate(search_mate);
  }

  // 관리자 touromate 디테일 페이지 관련 
  @GetMapping("/touromate/touromateNum/{touro_mate_num}")
  public List<AdminVO> touroMateNum(@PathVariable("touro_mate_num") Integer touro_mate_num) {
      return mainService.touroMateNum(touro_mate_num);
  }

  // 관리자 대시보드 - 회원수 가져오기
  @GetMapping("/dashboard/userCount")
  public Integer userCount() {
      return mainService.userCount();
  }

  // 관리자 대시보드 - 회원수 차트 값...
  @GetMapping("/dashboard/userCountGraph")
  public List<ChartVO> userCountGraph() {
    return mainService.userCountGraph();
  }
  
  // 관리자 대시보드 - 여행친구찾기 게시글 수 가져오기
  @GetMapping("/dashboard/touroviewCount")
  public Integer touroviewCount() {
      return mainService.touroviewCount();
  }

  // 관리자 대시보드 - 여행친구찾기 게시글 차트 값...
  @GetMapping("/dashboard/touromateCountGraph")
  public List<ChartVO> touromateCountGraph() {
    return mainService.touromateCountGraph();
  }   

  // 관리자 대시보드 - 후기 게시글 수 가져오기
  @GetMapping("/dashboard/reviewCount")
  public Integer reviewCount() {
      return mainService.reviewCount();
  }

  // 관리자 대시보드 - 여행후기 게시글 차트 값...
  @GetMapping("/dashboard/touroviewCountGraph")
  public List<ChartVO> touroviewCountGraph() {
    return mainService.touroviewCountGraph();
  }

  // 관리자 대시보드 - 영수증 리뷰 수 가져오기
  @GetMapping("/dashboard/receiptReviewCount")
  public Integer receiptReviewCount() {
      return mainService.receiptReviewCount();
  }

   // 관리자 대시보드 - 영수증 리뷰 차트 값...
   @GetMapping("/dashboard/receiptCountGraph")
   public List<ChartVO> receiptCountGraph() {
     return mainService.receiptCountGraph();
   }

   // 관리자 대시보드 - 연령대 별 회원 수
   @GetMapping("/dashboard/getAgeUser")
   public AdminVO getAgeUser() {
       return mainService.getAgeUser();
   }
   

  // 관리자 대시보드 - 우리나라 지도 : 선호도 순위 4개 통계
  @GetMapping("/dashboard/locPrefer")
  public List<MainAdminVO> locPrefer() {
      return mainService.locPrefer();
  }

  // 관리자 후기 게시판 신고 3번 이상 찾기
  @GetMapping("/touroview-list/blind/count")
  public Integer touroviewBlindCount(@RequestParam Integer touroview_num) {
    return mainService.touroviewBlindCount(touroview_num);
  }


  
  // 관리자 후기 게시판 신고 3번 이상 게시글 블라인드 처리
  @PostMapping("/touroview/blind/{touroview_num}")
  public void touroviewBlind(@PathVariable("touroview_num") Integer touroview_num, TouroviewVO vo) {
    vo.setTouroview_num(touroview_num);
    mainService.touroviewBlind(vo);
      
  }

  // 관리자 문의 답변 보내기 - DB 저장
  @PostMapping("/inquiry/inquiryReview")
  public void inquiryReview(@RequestBody AdminVO vo) {
    mainService.inquiryReview(vo);
  }

  // 관리자 문의 답변하면 -> inquiry_process = 1로 변경
  @PostMapping("/inquiry/inquiryProcess")
  public void inquiryProcess(@RequestBody AdminVO vo) {
    mainService.inquiryProcess(vo);
  }

  // 관리자 문의 답변 수정하기 - DB 수정
  @PostMapping("/inquiry/inquiryReviewUpdate")
  public void inquiryReviewUpdate(@RequestBody AdminVO vo) {
    mainService.inquiryReviewUpdate(vo);
  }

  // 관리자 대시보드 - 인기 게시물 가져오기
  @GetMapping("/touroview/popularPost")
  public List<AdminVO> popularPost(Model m) {
    List<AdminVO> result = mainService.popularPost();
    m.addAttribute("popularPost", result);
    return result;
  } 

  // 관리자 대시보드 - 인기 여행지 가져오기
  @GetMapping("/wishlist/popularTour")
  public List<AdminVO> popularTour() {
    List<AdminVO> result = mainService.popularTour();
    return result;
  }


  // 관리자 유저 상세정보 보기
  @GetMapping("/user/userListOne/{user_id}")
  public AdminVO userListOne(@PathVariable("user_id") String user_id) {
    AdminVO result = mainService.userListOne(user_id);
    return result;

  }
  


  
  
  




  
}
