package com.example.coding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.coding.dao.AdminDAO;
import com.example.coding.domain.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {


    @Autowired
    private AdminDAO adminDAO;



    public List<AdminVO> tourList() {
        List<AdminVO> list = adminDAO.tourList();
        System.out.println("확인: " + list.size());
        return list;
    }
    
    // 후기 게시판 내부에서 search 
    public List<AdminVO> search_touro(String search_touro){
        List<AdminVO> list = adminDAO.search_touro(search_touro);
        return list ; 
    }

    // 디테일
    public AdminVO tourdetail(AdminVO vo) {
        return adminDAO.tourdetail(vo);
    }

    // 여행지 삭제
    public int deleteNum(AdminVO vo) {
        int result = adminDAO.deleteNum(vo);
        return result;
    }

    public int tourInsert(AdminVO vo) {

        return adminDAO.tourInsert(vo);
    }


    // 유저 리스트 출력
    public List<AdminVO> userList() {
    List<AdminVO> userlist = adminDAO.userList();
    System.out.println("확인: " + userlist.size());
    return userlist;
    }

    // 후기 게시판 리스트 출력
    public List<AdminVO> touroviewList() {
    List<AdminVO> viewList = adminDAO.touroviewList();
    System.out.println("확인: " + viewList.size());
    return viewList;
    }
    
    public List<AdminVO> touroViewNum(Integer touroview_num) {
        return adminDAO.touroViewNum(touroview_num);
    }


    // 여행지 이미지 제외 수정
    public int modifyTour(AdminVO vo){
        return adminDAO.modifyTour(vo);
    }

    // 푸터 여행지 select
    public List<AdminVO> footer_tour_list(){
        List<AdminVO> list = adminDAO.footer_tour_list();
        return list;
    }

    // 푸터 후기 게시판 좋아요 top4
    public List<AdminVO> footer_toroview_list(){
        List<AdminVO> list = adminDAO.footer_toroview_list();
        return list;
    }

    // 문의 리스트
    public List<AdminVO> inquiry() {
        List<AdminVO> list = adminDAO.inquiry();
        System.out.println("확인: " + list.size());
        return list;
    }
    
}
