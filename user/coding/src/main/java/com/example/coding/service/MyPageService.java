package com.example.coding.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.example.coding.domain.ImgVO;
import com.example.coding.domain.InquiryVO;
import com.example.coding.domain.ReceiptVO;
import com.example.coding.domain.TourReviewVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;
import com.example.coding.domain.WishListVO;

public interface MyPageService {

    // mypage 사용자 정보 가져오기
    public UserVO getUserProfile(String userId);

    // 사용자 프로필 사진 가져오기
    public String getUserProfileImage(String userId);


    // -------------------------------------------------
    // 마이페이지 - 메인페이지 - 개수
    // 작성한 리뷰 개수 가져오기
    public int getTouroviewCountByUserId(String userId);
    // 여행지 리뷰 개수 가져오기
    public int getTourReviewCountByUserId(String userId);
    // 여행지 후기 리뷰 개수 가져오기
    public int getTouroviewReviewCountByUserId(String userId);
    // 여행지 담은 개수 가져오기
    public int getTourWishCountByUserId(String userId);


    // 게시글 가져오기
    // 여행 친구
    public int countTouroMate(String userId);
    // 여행 후기
    public int countTouroview(String userId);
    // 나의 발자취
    public int countReceipt(String userId);


    // -----------------------------------------
    // 마이페이지 - 프로필 수정
    public void updateUserProfile(UserVO userVO);
    // public void saveImageInfo(ImgVO imgVO);
    // public ImgVO getImgInfo(String img_real_name);
    // public String storeImage(MultipartFile file);



    // -----------------------------------------
    // 마이페이지 - 작성한 글
    // 여행지 여행친구찾기
    public List<TouroMateVO> getMyPageTouroMateList(String userId, int page, int pageSize);
    public int getTotalTouroMateCount(String userId);

    // 여행 후기
    public List<TouroviewVO> getMyPageTouroviewList(String userId, int page, int pageSize);
    public int getTotalTouroviewCount(String userId);

    // 여행 후기 리뷰 댓글
    public List<TouroviewReviewVO> getMyPageTouroviewReviewList(String userId, int page, int pageSize);
    public int getTotalTouroviewReviewCount(String userId);

    // 여행지 리뷰 댓글
    public List<TourReviewVO> getMyPageTourReviewList(String userId, int page, int pageSize);
    public int getTotalTourReviewCount(String userId);

    
    
    // -----------------------------------------
    // 마이페이지 - 나의 발자취
    public List<ReceiptVO> getMyPageReceiptList(String userId, int page, int pagesize3);
    public int countReceipts(String userId);
    
    
    // -----------------------------------------
    // 마이페이지 - 나의 발자취 마커찍기
    
    public List<ReceiptVO> getReceiptsByUserId(String userId);

    
    // -----------------------------------------
    // WishListVO 목록을 가져오는 메서드
    public List<WishListVO> getWishList(String userId, int page, int pagesize);
    public int countWishList(String userId);




    // ----------------------------------------------
    // 사용자 ID를 기반으로 해당 사용자의 문의 내역 조회
    public List<InquiryVO> getInquiryByUserId(String userId, int page, int pagesize2);
    public int countInquiryList(String userId);


}
