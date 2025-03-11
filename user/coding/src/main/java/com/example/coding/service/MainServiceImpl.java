package com.example.coding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.coding.dao.MainDAO;
import com.example.coding.domain.AdminTouroMateVO;
import com.example.coding.domain.AdminVO;
import com.example.coding.domain.ChartVO;
import com.example.coding.domain.MainAdminVO;
import com.example.coding.domain.MainVO;
import com.example.coding.domain.Reco1VO;
import com.example.coding.domain.TourReviewVO;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;

@Service
public class MainServiceImpl implements MainService{

  @Autowired
  MainDAO mainDAO;

  // 유저별 선호 지역 가져오기 - 3개 - ajax
  @Override
  public MainVO preferLoc(UserVO vo) {
    MainVO result = mainDAO.preferLoc(vo);
    // System.out.println(result);    
    return result;
  }
  
  // 유저 선호 지역으로 사계절 갈 만한 곳 보여주기
  // @Override
  // public List<MainVO> seasonRecommand(UserVO vo) {
  //   List<MainVO> result = mainDAO.seasonRecommand(vo);
  //   // System.out.println("Service" + result);
  //   return result;
  // }

  // 메인 유저 선호 1순위 여행지 타입에 대한 여행지 추천
  @Override
  public List<TourVO> getReco1(Reco1VO vo) {
    List<TourVO> result = mainDAO.getReco(vo);
    return result;
  }
  
  // 메인 유저 선호 2순위 여행지 타입에 대한 여행지 추천
  @Override
  public List<TourVO> getReco2(Reco1VO vo) {
    List<TourVO> result = mainDAO.getReco(vo);
    return result;
  }

  // 메인 유저 선호 3순위 여행지 타입에 대한 여행지 추천
  @Override
  public List<TourVO> getReco3(Reco1VO vo) {
    List<TourVO> result = mainDAO.getReco(vo);
    return result;
  }

  // 유저 선호 지역정보 가져오기
  @Override
  public MainVO getUserInfo(MainVO vo) {
    MainVO result = mainDAO.getUserInfo(vo);
    // System.out.println(result);    
    return result;
  }

  // 메인 유저 선호 1순위 지역에 대한 1순위 여행지 추천
  @Override
  public List<TourVO> getRecoType1(Reco1VO vo) {
    List<TourVO> result = mainDAO.getRecoType(vo);
    return result;
  }

  // 메인 유저 선호 1순위 지역에 대한 2순위 여행지 추천
  @Override
  public List<TourVO> getRecoType2(Reco1VO vo) {
    List<TourVO> result = mainDAO.getRecoType(vo);
    return result;
  }

  // 메인 유저 선호 1순위 지역에 대한 3순위 여행지 추천
  @Override
  public List<TourVO> getRecoType3(Reco1VO vo) {
    List<TourVO> result = mainDAO.getRecoType(vo);
    return result;
  }

  // 후기 게시글의 긍정 부정 판단으로 사용자 선호 지역 중에 여행지 추천
  @Override
  public List<TourVO> yesResult(Reco1VO vo) {
    List<TourVO> result = mainDAO.yesResult(vo);
    return result;
  }

  @Override
  public List<MainVO> bestReviewer() {
    return mainDAO.bestReviewer();
  }

  // 관리자 여행 찾기 게시판 리스트
  @Override
  public List<AdminTouroMateVO> touromateList() {
    List<AdminTouroMateVO> mateList = mainDAO.touromateList();
    System.out.println("MateService"+ mateList);
    return mateList;
  }

  // 관리자 touromate 검색
  @Override
  public List<AdminTouroMateVO> searchMate(String search_mate) {
    return mainDAO.searchMate(search_mate);
  }

  // 관리자 여행친구찾기 게시판 상세보기
  @Override
  public List<AdminVO> touroMateNum(Integer touro_mate_num) {
    return mainDAO.touroMateNum(touro_mate_num);
  }

  // 관리자 대시보드 - 회원수 가져오기
  @Override
  public Integer userCount() {
    return mainDAO.userCount();
  }

  // 관리자 대시보드 - 회원수 차트 값...
  @Override
  public List<ChartVO> userCountGraph() {
    return mainDAO.usercountGraph();
  }

  // 관리자 대시보드 - 여행친구찾기 게시글 수 가져오기
  @Override
  public Integer touroviewCount() {
    return mainDAO.touroviewCount();
  }

  // 관리자 대시보드 - 여행친구 찾기 게시글 차트 값...
  @Override
  public List<ChartVO> touromateCountGraph() {
    return mainDAO.touromateCountGraph();
  }

  // 관리자 대시보드 - 후기 게시글 수 가져오기
  @Override
  public Integer reviewCount() {
    return mainDAO.reviewCount();
  }

  // 관리자 대시보드 - 여행후기 게시글 차트 값...
  @Override
  public List<ChartVO> touroviewCountGraph() {
    return mainDAO.touroviewCountGraph();
  }

  // 관리자 대시보드 - 영수증 리뷰 수 가져오기
  @Override
  public Integer receiptReviewCount() {
    return mainDAO.receiptReviewCount();
  }

  // 관리자 대시보드 - 영수증 리뷰 차트 값...
  @Override
  public List<ChartVO> receiptCountGraph() {
    return mainDAO.receiptCountGraph();
  }

  // 관리자 대시보드 - 연령대 별 회원 수
  @Override
  public AdminVO getAgeUser() {
    return mainDAO.getAgeUser();
  }

  // 관리자 대시보드 - 우리나라 지도 : 선호도 순위 4개 통계
  @Override
  public List<MainAdminVO> locPrefer() {
    return mainDAO.locPrefer();  
  }
  // 각 게시물 블라인드 수 가져오기
  @Override
  public Integer touroviewBlindCount(Integer touroview_num) {
    return mainDAO.touroviewBlindCount(touroview_num);
  } 

  // 관리자 후기 게시판 신고 3번 이상 게시글 블라인드 처리
  @Override
  public void touroviewBlind(TouroviewVO vo) {
    mainDAO.touroviewBlind(vo);
  }

  // 관리자 문의 답변 보내기 - DB 저장
  @Override
  public void inquiryReview(AdminVO vo) {
    mainDAO.inquiryReview(vo);
  }

  // 관리자 문의 답변하면 -> inquiry_process = 1로 변경
  @Override
  public void inquiryProcess(AdminVO vo) {
    mainDAO.inquiryProcess(vo);
  }

  // 관리자 문의 답변 수정하기 - DB 수정
  @Override
  public void inquiryReviewUpdate(AdminVO vo) {
    mainDAO.inquiryReviewUpdate(vo);
  }

  // 관리자 대시보드 - 인기 게시물 가져오기
  @Override
  public List<AdminVO> popularPost() {
    return mainDAO.popularPost();
  }

  // 관리자 대시보드 - 인기 여행지 가져오기
  @Override
  public List<AdminVO> popularTour() {
    return mainDAO.popularTour();
  }

  // 여행지 - ajax로 리뷰 달기!!!
  public void reviewInsert(TourReviewVO vo) {
    mainDAO.reviewInsert(vo);
  }

  // 여행지 - 리뷰 가져오기
  @Override
  public List<TourReviewVO> reviewSelect(TourReviewVO vo) {
    List<TourReviewVO> result = mainDAO.reviewSelect(vo);
    return result;
  } 


   // 여행후기 - ajax로 리뷰 달기!!!
   public void touroviewReviewInsert(TouroviewReviewVO vo) {
    mainDAO.touroviewReviewInsert(vo);
  }

  // 여행후기 - 리뷰 가져오기
  @Override
  public List<TouroviewReviewVO> touroviewReviewSelect(TouroviewReviewVO vo) {
    List<TouroviewReviewVO> result = mainDAO.touroviewReviewSelect(vo);
    return result;
  }

  // 관리자 유저 상세정보 보기
  @Override
  public AdminVO userListOne(String user_id) {
    return mainDAO.userListOne(user_id);
  }

 

  

 

  
  
}
                            