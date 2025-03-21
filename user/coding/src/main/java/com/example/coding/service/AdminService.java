package com.example.coding.service;

import java.util.List;

import com.example.coding.domain.*;
import org.springframework.web.multipart.MultipartFile;

public interface AdminService {

    // 여행지 
    List<AdminTourVO> tourList();
    AdminTourDetailVO tourdetail(AdminTourDetailVO vo);


    public int deleteNum(AdminVO vo);
    public int tourInsert(AdminVO vo, MultipartFile multipartFile);



    // 유저
    List<AdminUserVO> userList();
    
    // 후기 게시판 
    List<AdminTouroViewList> touroviewList();

    // 후기 게시판 디테일
    List<AdminVO> touroViewNum(Integer touroview_num); 

    // 여행지 이미지 제외 수정
    public int modifyTour(AdminVO vo);

    // 후기 게시판 내부에서 검색 
    List<AdminSearchTouro> search_touro( String search_touro);


    // 푸터 여행지 관한 select 
    List<FooterTourListVO> footer_tour_list();

    
    // 푸터 후기 게시판 관한 select 
    List<FooterTouroViewVO> footer_toroview_list();

    // 문의 리스트
    List<InquiryVO> inquiry();

    
}
