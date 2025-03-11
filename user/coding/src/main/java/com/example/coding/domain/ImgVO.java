package com.example.coding.domain;

import lombok.Data;

@Data
public class ImgVO {
    
    // img Table
    private Long    img_num;            // 이미지 번호
    private String  img_name;           // 이미지명
    private String  img_real_name;      // 암호화 된 이미지명
    private String  img_path;           // 이미지 경로
    private String  img_size;           // 이미지 사이즈
    private String  img_width;          // 이미지 가로 크기
    private String  img_length;         // 이미지 세로 크기

    private int touroview_num;          // touroview 번호

}
