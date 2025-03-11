package com.example.coding.domain;

import lombok.Data;

@Data
public class TouroMateVO {
    private int touro_mate_num;     // 게시글 번호
    private String user_id;         // 아이디
    private String touro_mate_title; // 제목
    private int touro_mate_count;    // 인원수
    private int limit_age;          // 제한 나이
    private int limit_gender;       // 제한 성별
    private String touro_mate_content; // 상세내용
    private String touro_mate_name1; //여행지명 1
    private String touro_mate_name2; //여행지명 2
    private String touro_mate_name3; //여행지명 3
    private String touro_mate_addr1; // 여행지 주소 1
    private String touro_mate_addr2; // 여행지 주소 2
    private String touro_mate_addr3; // 여행지 주소 3
    private String touro_mate_date; // 작성 날짜, 수정 날짜


}
