package com.example.coding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.coding.domain.InquiryVO;
import com.example.coding.domain.ReceiptVO;
import com.example.coding.domain.TourReviewVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;
import com.example.coding.domain.WishListVO;
import com.example.coding.service.MyPageService;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/user")
@Controller
public class MyPageController {

    @Autowired
    private MyPageService myPageService;

    // ---------------------------------------- 마이페이지

    @GetMapping("/mypage")
    public String myPage(@RequestParam(name = "page", defaultValue = "1") int page,
                        @RequestParam(name = "reviewPage", defaultValue = "1") int reviewPage,
                        @RequestParam(name = "commentPage", defaultValue = "1") int commentPage,
                        @RequestParam(name = "wishlistPage", defaultValue = "1") int wishlistPage,
                        @RequestParam(name = "inquiryPage", defaultValue = "1") int inquiryPage,
                        @RequestParam(name = "matePage", defaultValue = "1") int matePage,
                        @RequestParam(name = "receiptPage", defaultValue = "1") int receiptPage,
                        HttpSession session, Model model) {

        // 세션에서 사용자 아이디 가져오기
        UserVO user = (UserVO) session.getAttribute("loggedInUser");
        String userId =  user.getUser_id();

        // 사용자 정보 가져와서 userVO에 저장
        UserVO userVO = myPageService.getUserProfile(userId);
        model.addAttribute("userVO", userVO); // 사용자 프로필

        // 사용자 프로필 사진 가져오기
        String profileImage = myPageService.getUserProfileImage(userId);
        model.addAttribute("profileImage", profileImage);


        // -----------------------------------------------------------------
        // 마이페이지 메인페이지 - 개수
        // 작성한 리뷰(여행 후기) 개수 가져오기
        int touroviewCount = myPageService.getTouroviewCountByUserId(userId);
        model.addAttribute("touroviewCount", touroviewCount); 

        // 여행지 댓글 개수 가져오기
        int tourReviewCount = myPageService.getTourReviewCountByUserId(userId);
        model.addAttribute("tourReviewCount", tourReviewCount); 

        // 리뷰 개수 가져오기
        int touroviewReviewCount = myPageService.getTouroviewReviewCountByUserId(userId);
        model.addAttribute("touroviewReviewCount", touroviewReviewCount); 

        // 여행지 담은 개수 가져오기
        int touroWishCount = myPageService.getTourWishCountByUserId(userId);
        model.addAttribute("touroWishCount", touroWishCount);


        // -----------------------------------------------------------------------
        // 작성한 글 페이징 처리 관련 게시물 전체 수
        // 여행 친구 게시물 개수
        int countTouroMate = myPageService.countTouroMate(userId);
        model.addAttribute("touroMateCount", countTouroMate);

        // 여행 후기 게시물 개수
        int countTouroview = myPageService.countTouroview(userId);
        model.addAttribute("touroviewCount", countTouroview);

        // 나의 발자취 게시물 개수
        int countReceipt = myPageService.countReceipt(userId);
        model.addAttribute("receiptCount", countReceipt);


        
    

        // ------------------------------------------------------------------
        // 마이페이지 - 작성한 글

        // ***페이징 관련***
        int pageSize = 3; // 한페이지에 표시할 게시물 수


        // '작성한 여행친구찾기'에 대한 데이터 페이징 정보
        List<TouroMateVO> touroMateVO = myPageService.getMyPageTouroMateList(userId, matePage, pageSize);
        int totalTouroMates = myPageService.getTotalTouroMateCount(userId);
        int totalTouroMatePages = (totalTouroMates + pageSize - 1) / pageSize;

        model.addAttribute("touroMateVO", touroMateVO);
        model.addAttribute("totalTouroMatePages", totalTouroMatePages);
        model.addAttribute("touroMateCurrentPage", matePage);
        
        // '작성한 게시물'에 대한 데이터와 페이징 정보
        List<TouroviewVO> touroviewVO = myPageService.getMyPageTouroviewList(userId, page, pageSize);
        int totalTouroviews = myPageService.getTotalTouroviewCount(userId);
        int totalTouroviewPages = (totalTouroviews + pageSize - 1) / pageSize;

        model.addAttribute("touroviewVO", touroviewVO);
        model.addAttribute("totalTouroviewPages", totalTouroviewPages);
        model.addAttribute("touroviewCurrentPage", page);

        // '작성한 리뷰'에 대한 데이터와 페이징 정보
        List<TouroviewReviewVO> touroviewReviewVO = myPageService.getMyPageTouroviewReviewList(userId, reviewPage, pageSize);
        int totalTouroviewReviews = myPageService.getTotalTouroviewReviewCount(userId);
        int totalTouroviewReviewPages = (totalTouroviewReviews + pageSize - 1) / pageSize;

        model.addAttribute("touroviewReviewVO", touroviewReviewVO);
        model.addAttribute("totalTouroviewReviewPages", totalTouroviewReviewPages);
        model.addAttribute("touroviewReviewCurrentPage", reviewPage);

        // '작성한 댓글'에 대한 데이터와 페이징 정보
        List<TourReviewVO> tourReviewVO = myPageService.getMyPageTourReviewList(userId, commentPage, pageSize);
        int totalTourReviews = myPageService.getTotalTourReviewCount(userId);
        int totalTourReviewPages = (totalTourReviews + pageSize - 1) / pageSize;

        model.addAttribute("tourReviewVO", tourReviewVO);
        model.addAttribute("totalTourReviewPages", totalTourReviewPages);
        model.addAttribute("tourReviewCurrentPage", commentPage);


        // -----------------------------------------------------------------------
        // 나의 발자취
        int pagesize3 = 6; // 한페이지에 표시할 게시물 수

        List<ReceiptVO> receiptVO = myPageService.getMyPageReceiptList(userId, receiptPage, pagesize3);
        int totalReceipts = myPageService.countReceipts(userId);
        int totalReceiptPages = (totalReceipts + pagesize3 - 1) / pagesize3;

        model.addAttribute("receiptVO", receiptVO);
        model.addAttribute("totalReceiptPages", totalReceiptPages);
        model.addAttribute("receiptCurrentPage", receiptPage);



        // -----------------------------------------------------------------------
        // 여행지 담기
        // 여행지 찜 목록 가져오기

        int pagesize = 9; // 한페이지에 표시할 게시물 수
        
        List<WishListVO> wishListVO = myPageService.getWishList(userId, wishlistPage, pagesize);
        int totalWishList = myPageService.countWishList(userId);
        int totalWishListPages = (totalWishList + pagesize - 1) / pagesize;

        model.addAttribute("wishListVO", wishListVO); // WishListVO
        model.addAttribute("totalWishListPages", totalWishListPages);
        model.addAttribute("wishListCurrentPage", wishlistPage);


        // 작성한 문의 내역
        // 문의 목록 가져오기

        int pagesize2 = 5; // 한페이지에 표시할 게시물 수

        List<InquiryVO> inquiryVO = myPageService.getInquiryByUserId(userId, inquiryPage, pagesize2);
        int totalInquiryList = myPageService.countInquiryList(userId);
        int totalInquiryListPages = (totalInquiryList + pagesize2 - 1) / pagesize2;

        model.addAttribute("inquiryVO", inquiryVO); // 사용자 문의
        model.addAttribute("totalInquiryListPages", totalInquiryListPages);
        model.addAttribute("InquiryCurrentPage", inquiryPage);



        

        return "user/mypage";


    }




    // ---------------------------------------------------------------
    // 프로필 수정 - 업데이트 ajax 
    // 프로필 정보와 이미지를 업데이트하는 메서드
    @PostMapping("/mypage/updateProfile")
    public ResponseEntity<String> updateProfile(@ModelAttribute UserVO userVO) {
        try {
            myPageService.updateUserProfile(userVO);
            return ResponseEntity.ok("프로필 업데이트 성공");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("프로필 업데이트 실패");
        }
    }
    


    // ---------------------------------------------------------------
    // 작성한 글 - 여행친구 찾기 ajax
    @GetMapping("/mypage/matePage")
    @ResponseBody
    public List<TouroMateVO> getTouroMateData(@RequestParam("matePage") int matePage, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        return myPageService.getMyPageTouroMateList(userId, matePage, matePage);
    }

    // 작성한 글 - 게시물 ajax
    @GetMapping("/mypage/data")
    @ResponseBody
    public List<TouroviewVO> getTouroviewData(@RequestParam("page") int page, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        int pageSize = 3; // 한 페이지에 표시할 게시물 수
        return myPageService.getMyPageTouroviewList(userId, page, pageSize);
    }

    // 작성한 글 - 리뷰 ajax
    @GetMapping("/mypage/reviewData")
    @ResponseBody
    public List<TouroviewReviewVO> getTouroviewReviewData(@RequestParam("reviewPage") int reviewPage, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        int pageSize = 3; // 한 페이지에 표시할 리뷰 수
        return myPageService.getMyPageTouroviewReviewList(userId, reviewPage, pageSize);
    }

    // 작성한 글 - 댓글 ajax
    @GetMapping("/mypage/commentData")
    @ResponseBody
    public List<TourReviewVO> getTourReviewData(@RequestParam("commentPage") int commentPage, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        int pageSize = 3; // 한 페이지에 표시할 댓글 수
        return myPageService.getMyPageTourReviewList(userId, commentPage, pageSize);
    }

    // ---------------------------------------------------------------
    // 여행지 담기 - ajax
    @GetMapping("/mypage/wishlist")
    @ResponseBody
    public List<WishListVO> getWishListData(@RequestParam("wishlistPage") int wishlistPage, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        int pagesize = 9;
        return myPageService.getWishList(userId, wishlistPage, pagesize);
    }
    
    // ---------------------------------------------------------------
    // 나의 발자취 (영수증)
    @GetMapping("/mypage/receipts")
    @ResponseBody
    public List<ReceiptVO> getReceipts(@RequestParam("receiptPage") int receiptPage, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        int pagesize3 = 6;
        return myPageService.getMyPageReceiptList(userId, receiptPage, pagesize3);
    }

        // ---------------------------------------------------------------
        // 나의 발자취 ( 마커 찍기 )
        @GetMapping("/mypage/getReceiptsmarker")
        @ResponseBody
        public List<Map<String, String>> getReceiptsmarker( HttpSession session ) {
            String userId = (String) session.getAttribute("loggedId");
            List<ReceiptVO> receipts = myPageService.getReceiptsByUserId(userId);

            List<Map<String, String>> positions = new ArrayList<>();
            for(ReceiptVO receipt : receipts) {
                Map<String, String> position = new HashMap<>();
                position.put("title", receipt.getReceipt_name());
                position.put("address", receipt.getReceipt_business_addr());
                positions.add(position);
            }

            return positions;
        }



    // ---------------------------------------------------------------
    // 나의 발자취 - 영수증 리뷰(앱)
    @GetMapping("user/appReview")
    public String app(HttpSession session, Model model) {

        // 세션에서 사용자 아이디 가져오기
        String userId = (String) session.getAttribute("loggedId");

        // 사용자 정보 가져와서 userVO에 저장
        UserVO userVO = myPageService.getUserProfile(userId);

        // 모델에 사용자 아이디 추가
        model.addAttribute("userId", userId); // 세션 id 값

        // UserVO
        model.addAttribute("userVO", userVO);

        // 콘솔 출력
        System.out.println("사용자 아이디: " + userId);
        System.out.println("사용자 아이디: " + userVO);

        return "user/user/appReview";

    }


    // 문의 내역 - ajax
    @GetMapping("/mypage/inquiry")
    @ResponseBody
    public List<InquiryVO> getInquiryData(@RequestParam("inquiryPage") int inquiryPage, HttpSession session) {
        String userId = (String) session.getAttribute("loggedId");
        int pagesize2 = 5;
        return myPageService.getInquiryByUserId(userId, inquiryPage, pagesize2);
    }


}
