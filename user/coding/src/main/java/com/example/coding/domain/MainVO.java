package com.example.coding.domain;

import lombok.Data;

@Data
public class MainVO {

    private String user_prefer_loc1;    // 1순위 선호 지역
    private String user_prefer_loc2;    // 2순위 선호 지역
    private String user_prefer_loc3;    // 3순위 선호 지역
    private String tour_name;           // 여행지 이름
    private String tour_addr;           // 여행지 주소
    private String tour_star;           // 여행지 별점
    private String tour_content;        // 여행지 설명
    private String tour_img1_path;      // 여행지 이미지 경로
    private String tour_cate_code;      // 여행지 타입 코드(숙박,음식점,관광지)
    private String tour_cate_code_name; // 여행지 타입 코드(숙박,음식점,관광지)
    private String tour_num;            // 여행지 번호
    private String user_prefer_loc1_name; // 1순위 선호지역 이름
    private String user_prefer_loc2_name; // 2순위 선호지역 이름
    private String user_prefer_loc3_name; // 3순위 선호지역 이름
    private String user_id;               // 유저 아이디
    private Double average_rating;        // 평균 평점
    private Integer comment_count;        // 리뷰 개수


  
}
