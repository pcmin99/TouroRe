package com.example.coding.domain;

import lombok.Data;

@Data
public class ImgDetailVO {
    
    private Long    img_detail_num;     // 이미지구분 번호
    private int     touro_mate_num;     // 여행 친구찾기 번호
    private int     touroview_num;      // 여행 후기 번호
    private int     receipt_num;        // 영수증 번호
    private String  tour_num;           // 여행지 번호
    private String  user_id;            // 사용자 아이디
    private Long    img_num;            // 이미지 번호

}
