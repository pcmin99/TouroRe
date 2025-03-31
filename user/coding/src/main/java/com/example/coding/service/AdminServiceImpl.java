package com.example.coding.service;

import java.io.File;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.example.coding.domain.*;
import com.example.coding.util.MD5Generator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.example.coding.dao.AdminDAO;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AdminServiceImpl implements AdminService {


    @Autowired
    private AdminDAO adminDAO;


    @Autowired
    private RedisTemplate<String, Object> redisTemplate; // Redis Template

    private static final String CACHE_PREFIX = "touroViewNum:";


//    // redis  사용시       4ms ~ 5ms
//    // redis 사용 안할시    15ms
    public List<AdminVO> touroViewNum(Integer touroview_num) {
        String cacheKey = CACHE_PREFIX + touroview_num;

        // Redis에서 캐시 확인
        List<AdminVO> cachedData = (List<AdminVO>) redisTemplate.opsForValue().get(cacheKey);
        if (cachedData != null) {
            return cachedData;
        }

        // 캐시에 데이터가 없으면 DB 조회 후 캐싱
        List<AdminVO> adminData = adminDAO.touroViewNum(touroview_num);
        if (adminData != null && !adminData.isEmpty()) {
            redisTemplate.opsForValue().set(cacheKey, adminData, 1, TimeUnit.HOURS); // 1시간 동안 캐싱
        }
        return adminData;
    }

//    public void updateTouroViewNum(Integer touroview_num, List<AdminVO> newData) {
//        // adminDAO.updateTouroViewNum(touroview_num, newData);
//        redisTemplate.delete(CACHE_PREFIX + touroview_num); // 캐시 삭제
//    }




//    public List<AdminVO> touroViewNum(Integer touroview_num) {
//        return adminDAO.touroViewNum(touroview_num);
//    }

    public List<AdminTourVO> tourList() {
        List<AdminTourVO> list = adminDAO.tourList();
        return list;
    }
    
    // 후기 게시판 내부에서 search
    @Transactional(readOnly = true)
    public List<AdminSearchTouro> search_touro(String search_touro){
            if(search_touro == ""){
                List<AdminSearchTouro> list = adminDAO.search_touro(search_touro);
                return list ;
            }
            String search_touroplus = search_touro+ '*' ; // SQL 에서 FULL TEST SEARCH 를 쓰면서 lIKE 처럼 연관을 뽑기 위해선 받는 데이터에 * 를 붙여야함
            List<AdminSearchTouro> list = adminDAO.search_touro(search_touroplus);
            return list ;

    }

    // 디테일
    public AdminTourDetailVO tourdetail(AdminTourDetailVO vo) {
        return adminDAO.tourdetail(vo);
    }

    // 여행지 삭제
    public int deleteNum(AdminVO vo) {
        int result = adminDAO.deleteNum(vo);
        return result;
    }
    
    // 등록
    public int tourInsert(AdminVO vo, MultipartFile multipartFile) {
        try {
            String img_name = multipartFile.getOriginalFilename();
            String img_real_name = new MD5Generator(img_name).toString() ;
            String save_path = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\tourimg";
            if( !new File(save_path).exists() ){
                new File(save_path).mkdir(); // mkdirs는 상위 디렉토리까지 만들어지기에 기본값에 폴더만 만드는 거면 mkdir
            }
            String img_path = save_path + "\\" + img_real_name;
            multipartFile.transferTo(new File(img_path));
            vo.setTour_img1_path("tourimg\\" + img_real_name);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return adminDAO.tourInsert(vo); // try에 해당 return 값을 넣을꺼면 catch 부분도 return 값이 있어야 하는데 고민중 25.03 --------------------------------------------------

    }


    // 유저 리스트 출력
    // ADMINCONTROLLER.userList => 로직 이동
    @Transactional(readOnly = true)
    public List<AdminUserVO> userList() {
    List<AdminUserVO> userlist = adminDAO.userList();
    for(AdminUserVO user : userlist){
        if(user.getImgRealName() != null){
            String path = "../../../../user/coding/src/main/resources/static/assets/images/profile/" ;
            String realName =  user.getImgRealName();
        }
    }
    return userlist;
    }

    // 후기 게시판 리스트 출력
    public List<AdminTouroViewList> touroviewList() {
    List<AdminTouroViewList> viewList = adminDAO.touroviewList();
    return viewList;
    }



    // 여행지 이미지 제외 수정
    public int modifyTour(AdminVO vo){
        return adminDAO.modifyTour(vo);
    }

    // 푸터 여행지 select
    public List<FooterTourListVO> footer_tour_list(){
        List<FooterTourListVO> list = adminDAO.footer_tour_list();
        return list;
    }

    // 푸터 후기 게시판 좋아요 top4
    public List<FooterTouroViewVO> footer_toroview_list(){
        List<FooterTouroViewVO> list = adminDAO.footer_toroview_list();
        return list;
    }

    // 문의 리스트
    public List<InquiryVO> inquiry() {
        List<InquiryVO> list = adminDAO.inquiry();
        return list;
    }
    
}
