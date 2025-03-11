package com.example.coding.domain;

import lombok.Data;

@Data
public class WishListVO {

    private Integer wishlist_num;   // 찜번호
    private String user_id;         // 사용자 아이디
    private String tour_num;        // 여행지 번호

    private String tour_img1_path;  // TourVO 가져오기 (사진)
    private String tour_name;       // // 여행지 이름


}
