package com.example.coding.domain;

import lombok.Data;

@Data
public class TourVO {
    private String tour_num;        // 여행지 번호
    private String tour_cate_code;  // 여행지 코드
    private String tour_name;       // 여행지 이름
    private String tour_content;    // 여행지 내용
    private String tour_contents;    // 여행지 내용
    private String tour_addr;       // 여행지 주소
    private String tour_postnum;    // 여행지 우편번호
    private String tour_site_addr;  // 여행지 사이트 주소
    private Integer inquiry_count;    // 문의 번호
    private Integer loc_cate_code;  // 여행지 지역 코드
    private double tour_lati;       // 위도
    private double tour_longi;      // 경도
    private float tour_star;        // 여행지 별점
    private String tour_sigungucode;// API 용
    private String tour_img1_path;  // 이미지 1
    private String tour_img2_path;  // 이미지 2

    private String keyword;         // keyword 받아오기
    
    private TourVO tourVO;          // detail에서 여행지 주소, 우편번호 받아오려고


}
