package com.example.coding.domain;

import lombok.Data;

@Data
public class TouroviewDetailVO {

  private Integer touroview_num;      // 여행 후기 번호
  private String  user_id;            // 아이디
  private String  tour_num;           // 여행지 번호
  private String  touroview_title;    // 게시글 제목
  private String  touroview_regdate;   // 등록일
  private String  touroview_update;   // 수정일
  private String  touroview_content;  // 게시글 상세 정보
  private String  tour_img1_path;  // 이미지 1
  private String  tour_img2_path;  // 이미지 2

  // img Table
  private Long    img_num;            // 이미지 번호
  private String  img_name;           // 이미지명
  private String  img_real_name;      // 암호화 된 이미지명

  private Long    img_detail_num;     // 이미지구분 번호
  private int     touro_mate_num;     // 여행 친구찾기 번호
  private int     receipt_num;        // 영수증 번호
  
}
