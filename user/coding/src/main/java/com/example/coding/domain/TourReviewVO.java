package com.example.coding.domain;

import lombok.Data;

@Data
public class TourReviewVO {

  private Integer tour_review_num;        // 여행지 댓글 번호
  private String  user_id;                // 아이디
  private String  tour_num;               // 여행지 번호
  private Integer receipt_num;            // 영수증 번호
  private String  tour_review_content;    // 여행지 댓글 내용
  private Integer tour_review_star;       // 여행지 댓글 별점
  private String  tour_review_regdate;    // 여행지 댓글 등록일

  private Long    img_num;                // 이미지 번호
  private String  img_name;               // 이미지명
  private String  img_real_name;          // 암호화 된 이미지명
  

}
