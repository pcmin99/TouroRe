package com.example.coding.domain;

import lombok.Data;
import java.util.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
public class AdminVO {
    

    
    private String tourNum;                 // 여행지 번호 
    private String tourName;                // 여행지 명 
    private Integer checkNum;               //  조회수 
    private Integer imgNum ;                // 이미지 번호
    private String imgName ;                // 이미지 명  
    private String imgRealName ;            // 원본 이미지 명  
    private String imgSize ;                // 이미지 크기
    private String imgWidth ;               // 이미지 가로
    private String imgLength ;              // 이미지 세로
    private String tourSiteAddr ;           // 여행지 사이트 주소
    private String tourAddr  ;              // 여행지 주소 
    private String tourContent ;            // 여행지 내용
    private String locCateCode ;            // 이름 미정
    private Integer wishlistNum;            // 찜 번호 
    private Integer inquiryNum ;            // 여행지 전화 번호  
    private String tourCateCode;            // 여행지 코드 
    private String tourCateName;            // 여행지 카테고리명
    private Integer imgDetailNum;           // 이미지 구분 
    private String tourPostnum;             // 우편 번호
    private String tourLati ;               // 위도 
    private String tourLongi;               // 경도
    private String tourStar;                // 여행지 별점
    private String tourTel ;                // 여행지 전화번호

    private String tour_num;                // 여행지 번호 
    private String tour_name;               // 여행지 명 
    private Integer check_num;              //  조회수 
    private Integer img_num ;               // 이미지 번호
    private String img_name ;               // 이미지 명  
    private String img_real_name ;          // 원본 이미지 명  
    private String img_size ;               // 이미지 크기
    private String img_width ;              // 이미지 가로
    private String img_length ;             // 이미지 세로
    private String tour_site_addr ;         // 여행지 사이트 주소
    private String tour_addr  ;             // 여행지 주소 
    private String tour_content ;           // 여행지 내용
    private String loc_cate_code ;          // 여행지 별점 
    private Integer wishlist_num;           // 찜 번호 
    private Integer inquiry_num ;           // 문의  번호 
    private String tour_cate_code;          // 여행지 코드 
    private String tour_cate_name;          // 여행지 카테고리명
    private Integer imgDetail_num;          // 이미지 구분 
    private String tour_postnum;            // 우편 번호
    private String tour_lati ;              // 위도 
    private String tour_longi;              // 경도
    private String tour_star;               // 여행지 별점 


    private String user_id;                 // 아이디
    private String user_name ;              // 이름
    private String user_pass ;              // 비밀 번호
    private String user_tel ;               // 전화 번호
    private String user_email ;             // 이메일
    private String user_addr ;              // 주소
    private String user_gender ;            // 성별
    private String user_age ;               // 나이
    private String user_prefer_type1 ;      // 선호 여행 유형1
    private String user_prefer_type2 ;      // 선호 여행 유형2
    private String user_prefer_type3 ;      // 선호 여행 유형3
    private String user_prefer_loc1 ;       // 선호 지역1
    private String user_prefer_loc2 ;       // 선호 지역2
    private String user_prefer_loc3 ;       // 선호 지역3
    private Integer admin_authority ;       // 관리자 권한 여부   
    private Integer user_login_authority ;  // 로그인 여부
    private String user_register_date ;       // 회원 가입 날짜 
    private String user_delete_date ;         // 탈퇴 날짜
    private String tour_img1_path;          // 여행지 이미지1
    private String tour_img2_path;          // 여행지 이미지2
    

    private String userId;                 // 아이디
    private String userName ;              // 이름
    private String userPass ;              // 비밀 번호
    private String userTel ;               // 전화 번호
    private String userEmail ;             // 이메일
    private String userAddr ;              // 주소
    private String userGender ;            // 성별
    private String userAge ;               // 나이
    private String userPreferType1 ;       // 선호 여행 유형1
    private String userPreferType2 ;       // 선호 여행 유형2
    private String userPreferType3 ;       // 선호 여행 유형3
    private String userPreferLoc1 ;        // 선호 지역1
    private String userPreferLoc2 ;        // 선호 지역2
    private String userPreferLoc3 ;        // 선호 지역3
    private Integer adminAuthority ;       // 관리자 권한 여부   
    private Integer userLoginAuthority ;   // 로그인 여부
    private String userRegisterDate ;        // 회원 가입 날짜 
    private String userDeleteDate ;          // 탈퇴 날짜

    private Integer touroview_num ;        // 후기 게시판 글 번호      
    private String touroview_title ;       // 게시글제목
    private String  touroview_regdate ;       // 등록일
    private String  touroview_update ;        // 수정일
    private String touroview_content ;     // 게시글 상세 정보 
    private Integer like_num ;             // 좋아요 번호
    private Integer like_count ;            // 좋아요 갯수
    private Integer report_num ;           // 신고 번호
    private String report_count ;          // 신고 갯수
    private String tour_tel ;               // 여행지 전화번호



    private String inquiry_title ;              //문의 제목
    private String inquiry_content ;           //문의 내용
    private String inquiry_process ;           //문의 답변여부
    private String inquiry_regdate ;           //문의 등록일
    

    private Integer inquiry_review_num ;        // 문의 답변 번호
    private String inquiry_review_content ;     // 문의 답변 내용



    private int touro_mate_num;     // 게시글 번호
    private String touro_mate_title; // 제목
    private int touro_mate_count;    // 인원수
    private int limit_age;          // 제한 나이
    private int limit_gender;       // 제한 성별
    private String touro_mate_content; // 상세내용
    private String touro_mate_name1; //여행지명 1
    private String touro_mate_name2; //여행지명 2
    private String touro_mate_name3; //여행지명 3
    private String touro_mate_addr1; // 여행지 주소 1
    private String touro_mate_addr2; // 여행지 주소 2
    private String touro_mate_addr3; // 여행지 주소 3
    private String touro_mate_date; // 작성 날짜, 수정 날짜

    // 연령대 별
    private Integer age_0_19;       
    private Integer age_20_30;
    private Integer age_31_40;
    private Integer age_41_50;
    private Integer age_51_60;
    private Integer age_61_and_above;

    // public static void main(String[] args) {
    //     // VO 인스턴스 생성
    //     AdminVO myData = new AdminVO();

    //    // 날짜와 시간을 원하는 형식으로 포매팅
    //    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    //    String formattedDateTime = myData.getTouroview_regdate().format(formatter);
   
    //    System.out.println("등록일: " + formattedDateTime);
   
    //    // 수정일자도 포맷팅
    //    String formattedDateTimeUpdate = myData.getTouroview_update().format(formatter);
    //    System.out.println("수정일: " + formattedDateTimeUpdate);
    // }




}
