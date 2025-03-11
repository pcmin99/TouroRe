package com.example.coding.domain;

import lombok.Data;

@Data
public class InquiryReviewVO {
    // 문의 답변
    private Integer inquiry_review_num;     // 문의답변번호
    private Integer inquiry_num;            // 문의번호
    private String  inquiry_review_content; // 문의답변내용

    private InquiryVO inquiryVO;            // 문의 정보
}
