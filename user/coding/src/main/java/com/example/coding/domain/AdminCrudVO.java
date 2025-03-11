package com.example.coding.domain;

import lombok.Data;

@Data
public class AdminCrudVO {

    private String tour_num;        // 여행지 번호 
    private String tour_name;       // 여행지 명 
    private Integer check_num;      //  조회수 
    private Integer img_num ;       // 이미지 번호
    private String img_name ;       // 이미지 명  
    private String img_real_name ;  // 원본 이미지 명  
    private String img_size ;       // 이미지 크기
    private String img_width ;      // 이미지 가로
    private String img_length ;     // 이미지 세로
    private String tour_site_addr ; // 여행지 사이트 주소
    private String tour_addr  ;       // 여행지 주소 
    private String tour_content ;   // 여행지 내용
    private String loc_cate_code ;  // 여행지 별점 
    private Integer wishlist_num;   // 찜 번호 
    private Integer inquiry_num ;   // 여행지 전화 번호 
    private String tour_cate_code;  // 여행지 코드 
    private String tour_cate_name;  // 여행지 카테고리명
    private Integer imgDetail_num; // 이미지 구분 
    private String tour_postnum;    // 우편 번호
    private String tour_lati ;      // 위도 
    private String tour_longi;      // 경도

    
}
