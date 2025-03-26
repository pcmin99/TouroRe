package com.example.coding.service;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.TouroviewDetailVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;

public interface TouroviewService {
    
    // ------------------------------ touroview_insert 페이지
    // (검색) 해당 키워드로 여행지 목록 가져오기
    public List<TourVO> findByKeyword(TourVO vo);
    
    // 후기 게시판 작성 후 db 저장
    public void saveTouroview(TouroviewVO touroviewVO, HttpServletRequest request);

    
    // ------------------------------ touroview_list 
    // (list 페이지) 페이징, 목록
    public List<TouroviewVO> getTouroviewList(String searchKeyword, int page, int size);
    
    // 목록 전체 가져오기
    public int getTotalPages(int size);
    
    // 여행지 이미지 사진 가져오기
    public TourVO getTourByNum(String tour_num);

    // 검색한 리스트 불러오기
    public List<TouroviewVO> searchTouroviewList(String keyword, int currentPage, int pageSize);

    // 페이징
    public int getTotalItemCount(String keyword);

    // 인기 게시물
    public List<LikeVO> getPopularTouroview();


    // ------------------------------ touroview_detail
    // 게시물 id로 touroview 게시물 가져오기
    public TouroviewVO getTouroviewById(int touroview_num);
    
    // 여행지 번호를 이용하여 해당 여행지 정보를 가져오기
    public TourVO getTourByTouroviewId(int touroview_num);
    

    // 후기 게시물 리뷰 정보 가져오기
    public TouroviewReviewVO getTouroviewReviewByTouroviewId(int touroview_num);
    
    // 신고
    public void insertReportCount(TouroviewVO touroviewVO);

    // 신고한 게시물인지 확인
    public boolean checkReported(int touroviewNum, String userId);

    // 작성자 정보 
    // public UserVO getUserById(String userId);


    // ----------------------------- 수정, 삭제
    // 후기 게시판 수정
    public void updateTouroview(TouroviewVO touroviewVO);
   
    // 이미지 수정
    public void UpdateImgDetail(ImgVO imgVO);
    
    // 후기 게시판 삭제
    public void deleteTouroview(int touroview_num);

    // 파일 업로드
    public void insertFileView(ImgDetailVO idvo);

    // 등록 번호 
    public int selectViewNum();

    // 디테일 배경 이미지 가져오기
    public TouroviewDetailVO getTouroviewImg(int tour_num);

    // 디테일 배경 이미지 가져오기
    public List<TouroviewDetailVO> detailviewImg(int touroview_num);

    // 좋아요 추가
    public void addWishList(LikeVO vo);

    // 좋아요 확인
    public int ckWishList(LikeVO vo);

    // 좋아요 삭제
    public int deleteWishList(LikeVO vo);
    
    // Touroview에서 Tour 정보 가져오기
    public TourVO getTourNameByTourNum(String tour_num);
    
} 
