package com.example.coding.service;


import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.coding.dao.ImgDetailDAO;
import com.example.coding.dao.TouroviewDAO;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.TouroviewDetailVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;


@Service
public class TouroviewServiceImpl implements TouroviewService{

    @Autowired
    private  TouroviewDAO touroviewDAO;

    @Autowired
    public ImgDetailDAO imgDetailDAO;

    // ----------------------------------------------------- touroview_insert
    // 여행지 검색
    @Override
    public List<TourVO> findByKeyword(TourVO vo) {
        try {
            // 여행지 검색 로직을 수행
            // ...
            List<TourVO> result = touroviewDAO.findByKeyword(vo);
            // System.err.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("여행지 검색 중 오류 발생", e);
        }
    }
    
    // 후기 게시물 입력
    @Override
    public void saveTouroview(TouroviewVO touroviewVO, HttpServletRequest request){
        HttpSession seesion = request.getSession();
        String userId = (String) seesion.getAttribute("logedId");
        touroviewVO.setUser_id(userId);

        // 여행 후기 데이터 저장하는 DAO 메소드 호출
        touroviewDAO.saveTouroview(touroviewVO);
    }


    // 여행후기 게시판 등록된 글번호 가져오기
    @Override
    public int selectViewNum() {

        return touroviewDAO.selectViewNum();
    }


    // 후기 게시물 사진 파일 등록
    @Override
    public void insertFileView(ImgDetailVO idvo) {

        imgDetailDAO.insertFileView(idvo);
    }


    // ----------------------------------------------------- touroview_list
    // 게시물 목록 불러오기
    // (list 페이지) 페이징
    @Override
    public List<TouroviewVO> getTouroviewList(String searchKeyword, int page, int size){
        int start = page * size;
        return touroviewDAO.getTouroviewList(searchKeyword, start, size);
    }

    @Override
    public int getTotalPages(int size){
        // 전체 게시물 수 가져오기
        int getTotalPages = touroviewDAO.getTotalPages();

        // 전체 페이지 수 계산 
        int totalPages = (int) Math.ceil((double) getTotalPages / size);
         
        return totalPages;
    }

    // 여행지 이미지 사진 가져오기
    @Override
    public TourVO getTourByNum(String tour_num){
        return touroviewDAO.getTourByNum(tour_num);
    }


    // 검색어
    @Override
    public List<TouroviewVO> searchTouroviewList(String keyword, int currentPage, int pageSize){
        pageSize = 9;
        int offset = (currentPage - 1) * pageSize;
        RowBounds rowBounds = new RowBounds(offset, pageSize);

        return touroviewDAO.searchByKeyword(keyword, rowBounds);
    }

    // 페이징
    @Override
    public int getTotalItemCount(String keyword) {
        return touroviewDAO.countItemsByKeyword(keyword);
    }

    // 인기 게시물
    public List<LikeVO> getPopularTouroview() {
        return touroviewDAO.getPopularTouroview();
    }




    // ----------------------------------------------------- touroview_detail
    // 게시물 id로(TouroviewVO) 게시물 가져오기(detail)
    @Override
    public TouroviewVO getTouroviewById(int touroview_num){

        return touroviewDAO.getTouroviewById(touroview_num);
    }


    // 여행지(TourVO) 번호를 이용하여 해당 여행지 정보를 가져오기
    @Override
   public TourVO getTourByTouroviewId(int touroview_num){
        return touroviewDAO.getTourByTouroviewId(touroview_num); 
   }


    // 후기 게시물 리뷰 정보 가져오기
    @Override
    public TouroviewReviewVO getTouroviewReviewByTouroviewId(int touroview_num){
        return touroviewDAO.getTouroviewReviewByTouroviewId(touroview_num);
    }

    // 신고
    @Override
    public void insertReportCount(TouroviewVO touroviewVO){
        touroviewDAO.insertReportCount(touroviewVO);
    }

    // 신고한 게시물인지 확인
    @Override
    public boolean checkReported(int touroviewNum, String userId){
        return touroviewDAO.checkReported(touroviewNum, userId) > 0;
    }

    // 작성자 정보
//    @Override
//    public UserVO getUserById(String userId) {
//        return touroviewDAO.getUserById(userId);
//    }



    // ----------------------------------------------------- touroview_update_delete
    // 후기 게시물 수정
    @Override
    public void updateTouroview(TouroviewVO touroviewVO){
        touroviewDAO.updateTouroview(touroviewVO);
    }

    // 이미지 수정
    @Override
    public void UpdateImgDetail(ImgVO imgVO){
        touroviewDAO.UpdateImgDetail(imgVO);
    }

    // 후기 게시물 삭제
    @Override
    public void deleteTouroview(int touroview_num){
        touroviewDAO.deleteTouroview(touroview_num);
    }


    // 디테일 배경 이미지 가져오기
    @Override
    public TouroviewDetailVO getTouroviewImg(int tour_num) {

        return touroviewDAO.getTouroviewImg(tour_num);
    }

    // 디테일 배경 이미지 가져오기
    @Override
    public List<TouroviewDetailVO> detailviewImg(int touroview_num) {
        return touroviewDAO.detailviewImg(touroview_num);
    }

    // 좋아요 추가
    @Override
    public void addWishList(LikeVO vo) {
        touroviewDAO.addWishList(vo);
    }

    // 좋아요 확인
    @Override
    public int ckWishList(LikeVO vo) {
        return touroviewDAO.ckWishList(vo);
    }

    // 좋아요 삭제
    @Override
    public int deleteWishList(LikeVO vo) {
        return touroviewDAO.deleteWishList(vo);
    }

    // Touroview -> tour 가져오기
    @Override
    public TourVO getTourNameByTourNum(String tour_num){
        return touroviewDAO.getTourNameByTourNum(tour_num);
    }



    

    

}
