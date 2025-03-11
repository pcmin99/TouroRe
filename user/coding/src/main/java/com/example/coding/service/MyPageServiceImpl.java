package com.example.coding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.coding.dao.MyPageDAO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.InquiryReviewVO;
import com.example.coding.domain.InquiryVO;
import com.example.coding.domain.ReceiptVO;
import com.example.coding.domain.TourReviewVO;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;
import com.example.coding.domain.WishListVO;

@Service
public class MyPageServiceImpl implements MyPageService {

    @Autowired
    public MyPageDAO myPageDAO;



    // -------------------------------------------------
    // mypage 사용자 정보 가져오기
    @Override
    public UserVO getUserProfile(String userId){

        // 데이터베이스에서 사용자 정보 조회
        return myPageDAO.getUserProfile(userId);
    }

    // 사용자 프로필 사진 가져오기
    public String getUserProfileImage(String userId){
        return myPageDAO.getUserProfileImage(userId);
    }

    
    // --------------------------------------------------
    // mypage - 메인페이지 - 개수
    // 사용자가 작성한 리뷰 개수 가져오기
    @Override
    public int getTouroviewCountByUserId(String userId){
        return myPageDAO.getTouroviewCountByUserId(userId);
    }
    // 여행지 리뷰 개수 가져오기
    @Override
    public int getTourReviewCountByUserId(String userId){
        return myPageDAO.getTourReviewCountByUserId(userId);
    }
    // 여행지 후기 리뷰 개수 가져오기
    @Override
    public int getTouroviewReviewCountByUserId(String userId){
        return myPageDAO.getTouroviewReviewCountByUserId(userId);
    }
    // 여행지 담은 개수 가져오기
    @Override
    public int getTourWishCountByUserId(String userId){
        return myPageDAO.getTourWishCountByUserId(userId);
    }

    // --------------------------------------------------
    // 작성한 게시물
    // 여행 친구 개수
    @Override
    public int countTouroMate(String userId){
        return myPageDAO.countTouroMate(userId);
    }
    // 여행 후기 개수
    @Override
    public int countTouroview(String userId){
        return myPageDAO.countTouroview(userId);
    }
    // 나의 발자취 개수
    @Override
    public int countReceipt(String userId){
        return myPageDAO.countReceipt(userId);
    }


    // ---------------------------------------------------------
    // mypage - 작성한 글
    // 여행지 여행친구찾기
    @Override
    public List<TouroMateVO> getMyPageTouroMateList(String userId, int page, int pageSize){
        int offset = (page - 1) * pageSize;
        return myPageDAO.getMyPageTouroMateList(userId, pageSize, offset);
    }
    // 개수
    @Override
    public int getTotalTouroMateCount(String userId){
        return myPageDAO.countTouroMates(userId);
    }

    // 여행 후기
    @Override
    public List<TouroviewVO> getMyPageTouroviewList(String userId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return myPageDAO.getMyPageTouroviewList(userId, pageSize, offset);
    }
    // 개수
    @Override
    public int getTotalTouroviewCount(String userId) {
        return myPageDAO.countTouroviews(userId);
    }

    // 여행 후기 리뷰 댓글
    @Override
    public List<TouroviewReviewVO> getMyPageTouroviewReviewList(String userId, int page, int pageSize){
        int offset = (page - 1) * pageSize;
        return myPageDAO.getMyPageTouroviewReviewList(userId, pageSize, offset);
    }
    // 개수
    @Override
    public int getTotalTouroviewReviewCount(String userId){
        return myPageDAO.countTouroviewReviews(userId);
    }

    // 여행지 리뷰 댓글
    @Override
    public List<TourReviewVO> getMyPageTourReviewList(String userId, int page, int pageSize){
        int offset = (page - 1) * pageSize;
        return myPageDAO.getMyPageTourReviewList(userId, pageSize, offset);
    }
    // 개수
    @Override
    public int getTotalTourReviewCount(String userId){
        return myPageDAO.countTourReviews(userId);
    }



    // ---------------------------------------------------------
    // mypage - 프로필 수정
    @Override
    public void updateUserProfile(UserVO userVO){
        myPageDAO.updateUserProfile(userVO);
    }

    // 프로필 사진
    // @Override
    // public void saveImageInfo(ImgVO imgVO){
    //     myPageDAO.saveImageInfo(imgVO);
    // }
    // @Override
    // public ImgVO getImgInfo(String img_real_name){
    //     return myPageDAO.getImgInfo(img_real_name);
    // }
    // @Override
    // public String storeImage(MultipartFile file){
    //     return myPageDAO.storeImage(file);

    // }


    // --------------------------------------------------
    // mypage - 나의 발자취
    @Override
    public List<ReceiptVO> getMyPageReceiptList(String userId, int page, int pagesize3){
        int offset = (page - 1) * pagesize3;
        return myPageDAO.getMyPageReceiptList(userId, pagesize3, offset);
    }

    @Override
    public int countReceipts(String userId){
        return myPageDAO.countReceipts(userId);
    }
   

    // --------------------------------------------------
    // mypage - 나의 발자취 마커찍기
    @Override
    public List<ReceiptVO> getReceiptsByUserId(String userId) {
        return myPageDAO.getReceiptsByUserId(userId);
    }




    // ---------------------------------------------------------
    // mypage - 여행지 담기 불러오기
   
    @Override
    public List<WishListVO> getWishList(String userId, int page, int pagesize){
        int offset = (page - 1) * pagesize;
        return myPageDAO.getWishList(userId, pagesize, offset);
    }
    
    @Override
    public int countWishList(String userId){
        return myPageDAO.countWishList(userId);
    }



    // --------------------------------------------------------
    // mypage - 사용자 ID를 기반으로 해당 사용자의 문의 내역 조회
    @Override
    public List<InquiryVO> getInquiryByUserId(String userId, int page, int pagesize2){
        int offset = (page - 1) * pagesize2;
        return myPageDAO.getInquiryByUserId(userId, pagesize2, offset);
    }
    
    @Override
    public int countInquiryList(String userId){
        return myPageDAO.countInquiryList(userId);
    }


}
