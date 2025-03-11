package com.example.coding.domain;

import lombok.Data;

@Data
public class ChartVO {

  private String month;         // 차트 월
  private Integer count_month;   // 월별 회원 수
  
}
