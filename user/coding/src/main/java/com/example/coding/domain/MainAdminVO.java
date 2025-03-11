package com.example.coding.domain;

import lombok.Data;

@Data
public class MainAdminVO {
  private String locCode;   // 지역 코드
  private Integer locCount; // 지역 코드별 수
  private String locName;   // 지역 코드 이름
  private Integer totalCount; // 지역 총 개수
}
