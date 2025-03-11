package com.example.coding.domain;

import lombok.Data;

@Data
public class ReceiptVO {
    // 영수증 테이블
    private Integer receipt_num;            // 영수증 번호
    private String  user_id;                // 아이디
    private String  tour_num;               // 여행지 번호
    private String  receipt_name;           // 상호명
    private String  receipt_business_num;   // 영수증 사업자 번호
    private String  receipt_business_addr;  // 영수증 사업자 번호 기준 주소 
    private String  receipt_review_content; // 영수증 댓글 내용
    private String  receipt_date;           // 영수증 날짜

}
