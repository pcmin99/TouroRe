package com.example.coding.domain;

import lombok.Data;

@Data
public class AdminTouroMateVO {

  private int touro_mate_num;     // 게시글 번호
  private String user_id;         // 아이디
  private String touro_mate_title; // 제목
  private int touro_mate_count;    // 인원수
  private String touro_mate_content; // 상세내용
  private int like_count;            // 좋아요 수
  private String touro_mate_date;   //  게시글 등록일
  private String search_mate;       // 검색어  


  
}
