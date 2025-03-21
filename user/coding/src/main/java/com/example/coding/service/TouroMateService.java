package com.example.coding.service;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.coding.controller.Touro;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;
import com.example.coding.domain.WishListVO;

@Service
public interface TouroMateService {
    List<TouroMateVO> getSelectedMateList(int page); // 전체 게시판 리스트 불러오기, 페이징 처리를 위한 페이지 번호로 인자 받기

    List<TouroMateVO> searchMateList(String searchKeyword, int page); // 검색한 리스트 불러오기, 검색어와, 페이지 번호를 인자로 받기

    // Touromate 리스트 게시판 페이지 네이션을 위한 전체 게시물 수 반환 메서드, 페이지 네이션에 사용
    int getTotalPages();

    // 게시글 작성 페이지 insert
    void registerCourse(TouroMateVO touroMateVO);

    // 게시글 상세보기 페이지 detail
    TouroMateVO getTouroMateById(int touro_mate_num);

    // 여행지 정보 가져오기
    List<TouroMateVO> getTravelPlaces(int touro_mate_num);

    // 게시글 작성자 정보 가져오기
    UserVO getAuthorInfo(String user_id);

    // 여행친구찾기와 채팅 테이블에 값 동시에 저장하는 메서드
    void registerTouroMateAndChat(TouroMateVO touroMateVO, HttpServletRequest request);

    // 해당 사용자가 특정 채팅방에 이미 있는지 확인하는 메서드
    int checkUserInChat(String user_id, String chat_num);

    // 여행친구찾기 글 이미지 올리기
    void insertMateImg(ImgVO ivo);

    // 이미지 디테일
    void insertFileMate(ImgDetailVO idvo);

    // 등록 번호 
    public int selectMateNum();

    // 디테일 페이지 이미지 가져오기
    public List<ImgVO> getImages(int touro_mate_num);

    // 채팅 참가 메서드
    String joinChat(String user_id, int touro_mate_num, Model m);

    // 남은 채팅 인원 수를 반환하는 메서드 추가
    int getRemainingChatUsers(int touro_mate_num);

     // 사용자 프로필 이미지 가져오기
    public UserProfileVO getProfile(UserProfileVO vo);

    // 게시글 삭제
    void deleteTouroMate(TouroMateVO vo);

    // 좋아요 추가
    void addWishListmate(LikeVO vo);

    // 좋아요 확인
    int ckWishListmate(LikeVO vo);

    // 좋아요 삭제
    int deleteWishListmate(LikeVO vo);

    // 랜덤 여행지 - 3개
    List<Touro> getRandTour();

    
}
 