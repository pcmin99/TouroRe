// package com.example.coding.dao;

// import java.util.List;

// import org.apache.ibatis.session.RowBounds;
// import org.mybatis.spring.SqlSessionTemplate;
// import org.springframework.context.annotation.Primary;
// import org.springframework.stereotype.Repository;

// import com.example.coding.domain.TouroMateVO;
// import com.example.coding.domain.UserVO;

// @Repository // Spring Data Repository
// @Primary
// public class TouroMateDAOImpl implements TouroMateDAO {

//     private final SqlSessionTemplate sqlSession;

//     // 생성자 -> 의존성 주입
//     public TouroMateDAOImpl(SqlSessionTemplate sqlSession){
//         this.sqlSession = sqlSession;
//     }

//     // 전체 게시물 리스트를 가져오는 메서드
//     @Override
//     public List<TouroMateVO> getSelectedMateList(RowBounds rowBounds) {
//         // MyBatis를 통한 결과를 반환
//         return sqlSession.selectList("com.example.coding.dao.TouroMateMapper.getSelectedMateList");
//     }

//     // 검색어를 통한 게시물 검색 메서드
//     @Override
//     public List<TouroMateVO> searchMateList(String searchKeyword, RowBounds rowBounds) {
      
//         return sqlSession.selectList("com.example.coding.dao.TouroMateMapper.searchMateList", searchKeyword);
//     }

//     // 전체 게시물 수를 반환 메서드
//     @Override
//     public int getTotalMateCount() {

//         return sqlSession.selectOne("com.example.coding.dao.TouroMateDAO.getTotalMateCount");
//     }

//     // 게시글 작성 페이지 insert
//     @Override
//     public void registerCourse(TouroMateVO touroMateVO) {
        
//         sqlSession.insert("com.example.coding.dao.TouroMateMapper.registerCourse", touroMateVO); 
//     }

//     // 게시글 상세 보기 페이지 detail
//     @Override
//     public TouroMateVO getTouroMateById(int touro_mate_num) {
//         return sqlSession.selectOne("com.example.coding.dao.TouroMateDAO.getTouroMateById", touro_mate_num);
        
//     }

//     // 여행지 정보 가져오기
//     @Override
//     public List<TouroMateVO> getTravelPlaces(int touro_mate_num) {
        
//         return sqlSession.selectList("com.example.coding.dao.TouroMatrDAO.getTravelPlaces", touro_mate_num);
//     }

//     // 게시글 작성자 정보 가져오기
//     @Override
//     public UserVO getAuthorInfo(String user_id) {
        
//         return sqlSession.selectOne("com.example.coding.dao.TouroMateDAO.getAuthorInfo", user_id);
//     }
    
// }
