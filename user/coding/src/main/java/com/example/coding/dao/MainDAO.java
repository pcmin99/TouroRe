package com.example.coding.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

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

@Mapper
public interface MainDAO {

  // 유저별 선호 지역 가져오기 - 3개 - ajax
  public MainVO preferLoc(UserVO vo);

  // 유저 선호 지역으로 사계절 갈 만한 곳 보여주기
  //public List<MainVO> seasonRecommand(UserVO vo);

  // 메인 유저 선호 1순위 여행지 타입에 대한 여행지 추천
  public List<TourVO> getReco(Reco1VO vo);

  // 연령대 별 유저 수
  public AdminVO getAgeUser();

  // 유저 선호 지역정보 가져오기
  public MainVO getUserInfo(MainVO vo);

  // 메인 유저 선호 1순위 지역에 대한 1순위 여행지 추천
  public List<TourVO> getRecoType(Reco1VO vo);

  // 후기 게시글의 긍정 부정 판단으로 사용자 선호 지역 중에 여행지 추천
  public List<TourVO> yesResult(Reco1VO vo);

  // 베스트 리뷰어 bestReviewer
  public List<MainVO> bestReviewer();

  // 관리자 여행 친구 찾기 리스트 보여주기
  public List<AdminTouroMateVO> touromateList();

  // 관리자 touromate 검색
  public List<AdminTouroMateVO> searchMate(String search_mate);

  // 관리자 여행친구찾기 게시판 상세보기
  public List<AdminVO> touroMateNum(Integer touro_mate_num);

  // 관리자 대시보드 - 회원수 가져오기
  public Integer userCount();

  // 관리자 대시보드 - 회원수 차트 값...
  public List<ChartVO> usercountGraph();

  // 관리자 대시보드 - 여행친구찾기 게시글 수 가져오기
  public Integer touroviewCount();

  // 관리자 대시보드 - 여행친구 찾기 게시글 차트 값...
  public List<ChartVO> touromateCountGraph();

  // 관리자 대시보드 - 후기 게시글 수 가져오기
  public Integer reviewCount();

  // 관리자 대시보드 - 여행후기 게시글 차트 값...
  public List<ChartVO> touroviewCountGraph();

  // 관리자 대시보드 - 영수증 리뷰 수 가져오기
  public Integer receiptReviewCount();

  // 관리자 대시보드 - 영수증 리뷰 차트 값...
  public List<ChartVO> receiptCountGraph();

  // 관리자 대시보드 - 우리나라 지도 : 선호도 순위 4개 통계
  public List<MainAdminVO> locPrefer();

  // 관리자 후기 게시판 신고 3번 이상 찾기
  public Integer touroviewBlindCount(Integer touroview_num);

  // 관리자 후기 게시판 신고 3번 이상 게시글 블라인드 처리
  public void touroviewBlind(TouroviewVO vo);

  // 관리자 문의 답변 보내기 - DB 저장
  public void inquiryReview(AdminVO vo);

  // 관리자 문의 답변하면 -> inquiry_process = 1로 변경
  public void inquiryProcess(AdminVO vo);

  // 관리자 문의 답변 수정하기 - DB 수정
  public void inquiryReviewUpdate(AdminVO vo);

  // 관리자 대시보드 - 인기 게시물 가져오기
  public List<AdminVO> popularPost();

  // 관리자 대시보드 - 인기 여행지 가져오기
  public List<AdminVO> popularTour();

  // 여행지 - 리뷰 달기
  public void reviewInsert(TourReviewVO vo);

  // 여행지 - 리뷰 가져오기
  public List<TourReviewVO> reviewSelect(TourReviewVO vo);


  // 여행후기게시판 - 리뷰 달기
  public void touroviewReviewInsert(TouroviewReviewVO vo);

  // 여행후기게시판 - 리뷰 가져오기
  public List<TouroviewReviewVO> touroviewReviewSelect(TouroviewReviewVO vo);

  // 관리자 유저 상세정보 보기
  public AdminVO userListOne(String user_id);

  

  

  



  
}