package com.example.coding.dao;

import com.example.coding.domain.TouroMateChatVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;
import com.example.coding.domain.WishListVO;
import com.example.coding.controller.Touro;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TouroMateChatUserVO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
/*
  * RowBounds
    - MyBatis 라이브러리(?)
    - 전체 레코드에서 원하는 범위의 레코드만을 가져올 수 있음.
    - MyBatis를 이용하여, 특정 개수 만큼의 레코드를 건너띄게 하는 속성이 있음
 */

@Mapper // MyBatis Mapper 인터페이스
public interface TouroMateDAO {

    //여행 친구 찾기 게시글 리스트를 가져오는 메서드, RowBounds를 사용하여 페이징 처리 범위 지정
    List<TouroMateVO> getSelectedMateList(RowBounds rowBounds);

    // searchKeyword를 사용하여 제목을 기준으로 필터링
    List<TouroMateVO> searchMateList(@Param("searchKeyword") String searchKeyword, RowBounds rowBounds);

    // 게시글 페이지 네이션 중 전체 게시글 반환 메서드
    int getTotalMateCount();

    // 게시글 작성 페이지 insert
    void registerCourse(TouroMateVO touroMateVO);

    // 게시글 상세보기 페이지 detail
    TouroMateVO getTouroMateById(int touro_mate_num);

    // 여행지 정보 가져오기
    List<TouroMateVO> getTravelPlaces(int touro_mate_num);

    // 게시글 작성자 정보 가져오기
    UserVO getAuthorInfo(String user_id);

    // insert함과 동시에 tour_mate_chat 정보 저장
    void registerTouroMateAndChat(TouroMateVO touroMateVO);

    void registerTouroMateChat(TouroMateVO touroMateVO);

    // 채팅 참가하기 버튼을 눌렀을 때, 값 디비에 저장하기
    void joinChat(@Param("user_id") String user_id, @Param("touro_mate_num") String touro_mate_num);

    void joinChat(TouroMateChatUserVO chatUserVO);

    // 이미 참여한 유저인지 확인하는 메서드
    int checkUserInChat(@Param("user_id") String user_id, @Param("chat_num") String chat_num);

    // TouroMateDAO.java
    int getCurrentChatUsers(int touro_mate_num);

    int getMaxChatUsers(int touro_mate_num);

    // 여행친구찾기 글 이미지 올리기
    void insertMateImg(ImgVO ivo);

    // 여행친구찾기 글 이미지 올리기(DETAIL)
    Long selectNum();

    // 여행친구찾기 글 번호
    int selectMateNum();

    // 디테일 이미지 가져오기
    List<ImgVO> getImages(int touro_mate_num);

    // 사용자 프로필 이미지 가져오기
    UserProfileVO getProfile(UserProfileVO vo);

    // 게시물 삭제
    void deleteTouroMate(TouroMateVO vo);

    // 작성자 정보 가져오기
    UserVO getAuthorInfoById(int touro_mate_num);

    // 좋아요 추가
    void addWishListmate(LikeVO vo);

    // 좋아요 확인
    int ckWishListmate(LikeVO vo);

    // 좋아요 삭제
    int deleteWishListmate(LikeVO vo);

    // 랜덤 여행지 3개
    List<Touro> getRandTour();


}