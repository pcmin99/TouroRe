package com.example.coding.domain;

import lombok.Data;

@Data
public class AdminTourDetailVO {

    private String tour_content ;
    private String tour_addr ;
    private String tour_site_addr ;
    private String tour_star ;
    private Integer tour_num ;
    private String tour_name ;
    private String img_path ;

    private String tourNum ; // 해당 숫자 보내는곳,받는곳 다 Num으로 처리 하였기에 작성



}
