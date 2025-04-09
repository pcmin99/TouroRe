package com.example.coding.service;

import java.io.File;
import java.sql.Time;
import java.util.List;
import java.util.concurrent.TimeUnit;

import com.example.coding.domain.*;
import com.example.coding.util.MD5Generator;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.example.coding.dao.AdminDAO;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@Slf4j
@Service
public class AdminServiceImpl implements AdminService {


    @Autowired
    private AdminDAO adminDAO;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Autowired
    private ObjectMapper objectMapper ;

    private static final String CACHE_PREFIX =  System.getenv("redis_prefix");




    /**
     * redis O = 4ms
     * redis X = 20ms
      초기에 캐시에 값이 없을시 불러와야 하기에 초기엔 좀 나옴
     */
    public List<AdminVO> touroViewNum(Integer touroview_num) {
        try{
            if(CACHE_PREFIX != null){
                String cacheKey1 = CACHE_PREFIX +  touroview_num ;
                Integer cachedData = (Integer) redisTemplate.opsForValue().get(cacheKey1);
                if (cachedData != null) {
                    return (List<AdminVO>) redisTemplate.opsForList() ; // opsForValue()는 문자열 기반이라 List로 변경
                }
            }
            // 캐시에 데이터가 없으면 DB 조회 후 캐싱
            String cacheKey = CACHE_PREFIX +  touroview_num ;
            List<AdminVO> adminData = adminDAO.touroViewNum(touroview_num);
            if (adminData != null && !adminData.isEmpty()) {
                String jsonData = objectMapper.writeValueAsString(adminData);
                redisTemplate.opsForValue().set(cacheKey, jsonData, 10, TimeUnit.MINUTES);
            }
            return adminData;
        }
        catch (Exception e) {
            log.error("touroViewNum 에러:",e);
            throw new RuntimeException(e);
        }
    }

    /**
     * 기본 캐쉬 키가 null일 경우 
     * db에서 값을 가져와 새롭게 key에 넣은 후 새로운 키값으로 캐쉬에 저장
     *
     * redis X =  21ms
     * redis O =  4ms
     */
    public List<AdminTourVO> tourList() {
        String cacheKey = CACHE_PREFIX ;
        if(cacheKey == null){
            List<AdminTourVO> list = adminDAO.tourList();
            String newcacheKey = CACHE_PREFIX + list ;
            redisTemplate.opsForValue().set(newcacheKey,list,10, TimeUnit.MINUTES);
            return list;
        }
            List<AdminTourVO> cacheData = (List<AdminTourVO>) redisTemplate.opsForValue().get(cacheKey);
            return cacheData ;
    }
    
    // 후기 게시판 내부에서 search
    @Transactional(readOnly = true)
    public List<AdminSearchTouro> search_touro(String search_touro){
        String cacheKey = CACHE_PREFIX+ search_touro ;
        List<AdminSearchTouro> cacheData = (List<AdminSearchTouro>) redisTemplate.opsForValue().get(cacheKey) ;
        if(cacheData != null ){
            return cacheData ;
        }
        else{
            if(search_touro == ""){
                List<AdminSearchTouro> list = adminDAO.search_touro(search_touro);
                redisTemplate.opsForValue().set(cacheKey,list,10,TimeUnit.MINUTES) ;
                return list ;
            }
            String search_touroplus = search_touro+ '*' ; // SQL 에서 FULL TEST SEARCH 를 쓰면서 lIKE 처럼 연관을 뽑기 위해선 받는 데이터에 * 를 붙여야함
            List<AdminSearchTouro> list = adminDAO.search_touro(search_touroplus);
            redisTemplate.opsForValue().set(cacheKey,list,10,TimeUnit.MINUTES) ;
            return list ;
        }
    }

    // 디테일
    public AdminTourDetailVO tourdetail(AdminTourDetailVO vo) {
        Object cacheKey = CACHE_PREFIX + vo ;
        AdminTourDetailVO ad = (AdminTourDetailVO) redisTemplate.opsForValue().get(cacheKey);
        try{
            if(CACHE_PREFIX != null){
                return ad ;
            }else{
                return adminDAO.tourdetail(vo);
            }
        } catch (Exception e) {
            log.error("tourdetail 에러 :",e);
            throw new RuntimeException(e);
        }
    }

    // 여행지 삭제
    @Async
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
            log.error("에러:",e);
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


    /**
     * 후기 게시판 리스트 출력
     * redis O =  3ms or 4ms
     * redis X = 12ms
     */
    public List<AdminTouroViewList> touroviewList() {
        String cacheKey = CACHE_PREFIX ;
        if(cacheKey == null){
            List<AdminTouroViewList> viewList = adminDAO.touroviewList();
            String newcacheKey = CACHE_PREFIX + viewList ;
            redisTemplate.opsForValue().set(newcacheKey,viewList,10, TimeUnit.MINUTES);
            return viewList;
        }
        List<AdminTouroViewList> cacheData = (List<AdminTouroViewList>) redisTemplate.opsForValue().get(cacheKey);
        return cacheData ;

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
