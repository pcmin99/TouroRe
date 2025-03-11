package com.example.coding.domain;

import lombok.Data;

@Data
public class InquiryVO {
   private Integer inquiry_num;     // 문의 번호
   private String inquiry_title;    // 제목
   private String inquiry_content;  // 내용
   private Integer inquiry_process; // 답변 여부
   private String user_id;          // 유저 아이디
   private String tour_num;         // 여행지 번호
   private String inquiry_regdate;  // 문의 날짜

   private String inquiry_review_content; // 문의 답변 
}
