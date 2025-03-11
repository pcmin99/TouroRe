package com.example.coding.domain;

import lombok.Data;

@Data
public class LikeVO {
    private int like_num;           // 좋아요 수 번호
    private int touroview_num;      // 여행 후기 번호
    private String user_id;         // 아이디
    private String like_count;      // 좋아요 수
    private int touro_mate_num;
}
