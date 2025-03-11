package com.example.coding.domain;

import lombok.Data;

@Data
public class ReportVO {
    
    private int report_num;         // 신호 횟수 번호
    private int touroview_num;      // 여행 후기 번호
    private String  user_id;            // 아이디
    private String  report_count;       // 신고횟수
}
