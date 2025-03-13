package com.example.coding.dao;

import java.util.List;

import com.example.coding.domain.*;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminDAO {

    // 여행지 관련
    public List<AdminTourVO> tourList();

    public AdminVO tourdetail(AdminVO vo);

    public int deleteNum(AdminVO vo );

    public int tourInsert(AdminVO vo);

    
    // 회원 리스트 출력
    public List<AdminVO> userList();

    //후기 게시판 리스트 출력
    public List<AdminVO> touroviewList();

    // 게시판 디테일
    public List<AdminVO> touroViewNum(Integer touroview_num);


    // 여행지 수정 (이미지 제외)
    public int modifyTour(AdminVO vo );

    // 후기 게시판 리스트 내부에서 리스트 검색
    public List<AdminSearchTouro> search_touro( String search_touroplus);


    // 푸터 여행지 별점  가장 높은 6 얘들 출력
    public List<FooterTourListVO> footer_tour_list();

    // 푸터 후기 게시판 좋아요 top4 출력
    public List<FooterTouroViewVO> footer_toroview_list();

    // 문의 리스트
    public List<InquiryVO> inquiry();

    
}