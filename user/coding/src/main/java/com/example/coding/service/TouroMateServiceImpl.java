package com.example.coding.service;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.coding.controller.Touro;
import com.example.coding.dao.ImgDAO;
import com.example.coding.dao.ImgDetailDAO;
import com.example.coding.dao.TouroMateDAO;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TouroMateChatUserVO;
import com.example.coding.domain.TouroMateVO;
import com.example.coding.domain.UserProfileVO;
import com.example.coding.domain.UserVO;

import jakarta.transaction.Transactional;

@Service
public class TouroMateServiceImpl implements TouroMateService {

    @Autowired
    public TouroMateDAO TouromateDAO;

    @Autowired
    public ImgDAO imgDAO;

    @Autowired
    public ImgDetailDAO imgDetailDAO;

    @Override
    // 전체 게시물 리스트 메서드
    public List<TouroMateVO> getSelectedMateList( int page ) {
        int pageSize = 10;
        int offset = (page -1 ) * pageSize;
        RowBounds rowBounds = new RowBounds(offset, pageSize);
        
        // DAO를 통한 전체 게시물 리스트 가져오기
        return TouromateDAO.getSelectedMateList(rowBounds);
    }

   @Override
   // 검색어를 이용한 게시물 리스트 메서드
    public List<TouroMateVO> searchMateList(String searchKeyword, int page) {
        int pageSize = 10;
        int offset = (page - 1) * pageSize;
        RowBounds rowBounds = new RowBounds(offset, pageSize);

        // DAO를 통한 검색어에 맞는 게시물 리스트 가져오기
        return TouromateDAO.searchMateList(searchKeyword, rowBounds);
    }

    @Override
    // Touromate 리스트 게시판의 전체 페이지 수를 반환 메서드
    public int getTotalPages() {
        int totalMateCount = TouromateDAO.getTotalMateCount();
        int pageSize = 10;

        // 전체 게시물 수를 페이지 사이즈로 나누어 전체 페이지 수를 계산하여 반환
        return (int) Math.ceil((double) totalMateCount / pageSize);
    }

    // 게시글 작성 페이지 insert
    @Override
    public void registerCourse(TouroMateVO touroMateVO) {
        
        TouromateDAO.registerCourse(touroMateVO);
    }

    // 게시글 detail 페이지
    @Override
    public TouroMateVO getTouroMateById(int touro_mate_num) {
        
        return TouromateDAO.getTouroMateById(touro_mate_num);
    }

    //여행지 정보 가져오기
    @Override
    public List<TouroMateVO> getTravelPlaces(int touro_mate_num) {
        
        return TouromateDAO.getTravelPlaces(touro_mate_num);
    }

    // 게시글 작성자 정보 가져오기
    @Override
    public UserVO getAuthorInfo(String user_id) {
        
        return TouromateDAO.getAuthorInfo(user_id);
    }

    @Transactional
    @Override
    public void registerTouroMateAndChat(TouroMateVO touroMateVO, HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserVO loggInUSer = (UserVO) session.getAttribute("loggedInUser");
        touroMateVO.setUser_id(loggInUSer.getUser_id());

        TouromateDAO.registerTouroMateAndChat(touroMateVO);
        TouromateDAO.registerTouroMateChat(touroMateVO);
    }

    // 채팅 참가하기 버튼을 눌렀을 때, tour_mate_chat_user 테이블에 값 저장
    @Transactional
    @Override
    public String joinChat(String user_id, int touro_mate_num, Model m) {
        // 채팅방 번호를 문자열로 변환
        String chat_num = String.valueOf(touro_mate_num);

        // 테이블에 해당 사용자와 채팅방이 존재하는지 확인
        int userCountInChat = TouromateDAO.checkUserInChat(user_id, chat_num);

        try {
            // 채팅방의 현재 사용자 수와 최대 사용자 수
            int currentChatUsers = TouromateDAO.getCurrentChatUsers(touro_mate_num);
            int maxChatUsers = TouromateDAO.getMaxChatUsers(touro_mate_num);
            if (userCountInChat == 1) {
                return "채팅 참가 성공" ;
            }
            // 채팅방이 꽉 찼는지 확인
            if (currentChatUsers < maxChatUsers) {
                // 이미 참여한 유저인지 확인
                if (userCountInChat == 0) {
                    // 채팅방 사용자 정보 담은 객체 
                    TouroMateChatUserVO chatUserVO = new TouroMateChatUserVO();
                    chatUserVO.setUser_id(user_id);
                    chatUserVO.setChat_num(chat_num);
            
                    // tour_mate_chat_user 테이블에 값 저장
                    TouromateDAO.joinChat(chatUserVO);
            
                    // 남은 인원 수 계산
                    int remainingUsers = maxChatUsers - currentChatUsers;
            
                    if (m != null) {
                        m.addAttribute("remainingUsers", remainingUsers);
                    }

                    return "채팅 참가 성공";
            
                } else {
                    // 이미 참여한 유저라면 여기서 처리
                    return "채팅 참가 성공";
                }
            } else {
                return "정원에 도달했습니다.";
            }            
        } catch (Exception e) {
            e.printStackTrace();
            return "채팅 오류 발생";
        }
    }

    // 여행친구찾기 글 이미지 올리기
    @Override
    public void insertMateImg(ImgVO ivo) {
        imgDAO.insertFile(ivo);
    }

    // 여행친구찾기 글 이미지 올리기(DETAIL)
    @Override
    public void insertFileMate(ImgDetailVO idvo) {
        imgDetailDAO.insertFileMate(idvo);
    }

    // 여행친구 찾기 등록된 글번호 가져오기
    @Override
    public int selectMateNum() {
         return TouromateDAO.selectMateNum();
    }

    @Override
    public List<ImgVO> getImages(int touro_mate_num) {
        return TouromateDAO.getImages(touro_mate_num);
    }


    // 남은 인원수 반환
    @Override
    public int getRemainingChatUsers(int touro_mate_num) {
    int currentChatUsers = TouromateDAO.getCurrentChatUsers(touro_mate_num);
    int maxChatUsers = TouromateDAO.getMaxChatUsers(touro_mate_num);
    return maxChatUsers - currentChatUsers;
    }

    @Override
    public int checkUserInChat(String user_id, String chat_num) {
        return TouromateDAO.checkUserInChat(user_id, chat_num);
    }

    // 사용자 프로필 가져오기
    @Override
    public UserProfileVO getProfile(UserProfileVO vo) {

        return TouromateDAO.getProfile(vo);

    }

    // 게시글 삭제
    @Override
    public void deleteTouroMate(TouroMateVO vo,HttpServletRequest request) {

        UserVO loggedInUser = (UserVO) request.getSession().getAttribute("loggedInUser");
        String loggedInUserId = loggedInUser.getUser_id();

        // 게시물 작성자 정보 가져오기
        UserVO authorId = (UserVO) TouromateDAO.getAuthorInfoById(vo.getTouro_mate_num());

        // 세션에 저장된 사용자와 게시물 작성자가 동일한지 확인
        if (loggedInUserId.equals(authorId.getUser_id())) {
            // 동일하다면 삭제 진행
            TouromateDAO.deleteTouroMate(vo);
        } else {
            // 동일하지 않다면 삭제 막기 (예외 처리 또는 다른 처리 방법 선택)
            throw new RuntimeException("Unauthorized");
        }
    }

    // 좋아요 추가
    @Override
    public void addWishListmate(LikeVO vo) {
        TouromateDAO.addWishListmate(vo);
    }

    // 좋아요 확인
    @Override
    public int ckWishListmate(LikeVO vo) {
        return TouromateDAO.ckWishListmate(vo);
    }

    // 좋아요 삭제
    @Override
    public int deleteWishListmate(LikeVO vo) {
        return TouromateDAO.deleteWishListmate(vo);
    }

    // 랜덤 여행지 3개
    @Override
    public List<Touro> getRandTour() {
        return TouromateDAO.getRandTour();
    }



    
    
}

