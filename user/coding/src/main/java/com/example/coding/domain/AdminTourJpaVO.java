package com.example.coding.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="tour")
public class AdminTourJpaVO {

    @Column(name = "tour_name")
    private String tourName;       // 여행지 명 

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "tour_num")
    private Integer tourNum;        // 여행지 번호 

    @Column(name = "inquiry_num")
    private Integer inquiryNum ;   // 여행지 전화 번호 

    @Column(name = "loc_cate_code")
    private Integer locCateCode ;  // 여행지 별점

    @Column(name = "tour_cate_code")
    private String tourCateCode;  // 여행지 코드
    
    @Column(name = "tour_cate_name")
    private String tourCateName;  // 여행지 카테고리명

    @Column(name = "tour_content")
    private String tourContent ;   // 여행지 내용

    @Column(name = "tour_Addr")
    private String tourAddr  ;       // 여행지 주소
    
    @Column(name = "tour_postnum")
    private String tourPostnum;    // 우편 번호

    @Column(name = "tour_site_addr")
    private String tourSiteAddr ; // 여행지 사이트 주소

    @Column(name = "tour_lati")
    private String tourLati ;      // 위도
    
    @Column(name = "tour_longi")
    private String tourLongi;      // 경도
    

}
