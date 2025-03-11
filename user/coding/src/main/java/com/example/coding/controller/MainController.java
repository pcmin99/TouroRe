package com.example.coding.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.coding.domain.AdminTouroMateVO;
import com.example.coding.domain.MainVO;
import com.example.coding.domain.Reco1VO;
import com.example.coding.domain.TourReviewVO;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.UserVO;
import com.example.coding.service.MainService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.websocket.server.PathParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

  @Autowired
  MainService mainService;

  // 유저별 선호 지역 가져오기 - 3개 - ajax
  @RequestMapping(value = "/preferLoc")
  @ResponseBody
  public MainVO preferLoc(UserVO vo) {
    // System.out.println(vo.getUser_id());
    MainVO result = mainService.preferLoc(vo);
    // System.out.println(result);
    return result;

  }
  
  // 유저 선호 지역정보 가져오기
  // 유저 선호 지역으로 사계절 갈 만한 곳 보여주기
  @RequestMapping(value = "/touro")
  public void seasonRecommand(HttpServletRequest request, UserVO vo, Model m, MainVO mainvo) {
    // 세션에서 유저 아이디 가져오기
    String userId = (String) request.getSession().getAttribute("loggedId");
    System.out.println("===="+userId);

    // UserVO user = (UserVO) request.getSession().getAttribute("loggedInUser");
    // String user_Id = user.getUser_id();
    // if(user_Id != null) {
    //   vo.setUser_id(user_Id);                                                                                                                                                                                                                                                                          
    //   mainvo.setUser_id(user_Id);
    // } else {
    //   vo.setUser_id("Byounggon");
    //   mainvo.setUser_id("Byounggon");
    // }
    // System.out.println("^^^^^^^^"+user_Id);

    if(userId != null) {
      vo.setUser_id(userId);                                                                                                                                                                                                                                                                          
      mainvo.setUser_id(userId);
    } else {
      vo.setUser_id("Byounggon");
      mainvo.setUser_id("Byounggon");
    }
    System.out.println(mainvo.getUser_id());
    // vo.setUser_id("dlwldus");
    List<MainVO> result = mainService.seasonRecommand(vo);
    MainVO userLoc = mainService.getUserInfo(mainvo);
    // System.out.println(userLoc);
    m.addAttribute("userLoc", userLoc);
    // System.out.println(result);
    // return result;
    m.addAttribute("winter", result);
    List<MainVO> bestReviewer = mainService.bestReviewer();
    m.addAttribute("bestReview", bestReviewer);
  }

  // // 메인 유저 선호 1순위 여행지 타입에 대한 여행지 추천
  // // 세션의 유저 아이디 파이썬으로 전송
  // @MessageMapping("/sendSessionId")
  // @SendTo("/reco/tourNum")
  // public String sendSessionId(String sessionId) {
  //     // 받은 세션 ID를 로직에 활용하고, 필요한 데이터를 응답으로 보냄
  //     String result = "Received session ID: " + sessionId;
  //     return result;
  // }
  
  // 메인 유저 선호 1순위 여행지 타입에 대한 여행지 추천
  @RequestMapping("/preferLoc1Reco")
  @ResponseBody
  public List<TourVO> getReco1(Reco1VO vo) {
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    String num5 = vo.getTour_num5().replaceAll("\\.0$", "");
    String num6 = vo.getTour_num6().replaceAll("\\.0$", "");
    String num7 = vo.getTour_num7().replaceAll("\\.0$", "");
    String num8 = vo.getTour_num8().replaceAll("\\.0$", "");
    String num9 = vo.getTour_num9().replaceAll("\\.0$", "");
    // String num10 = vo.getTour_num10().replaceAll("\\.0$", "");
    // System.out.println("num9" + num9);
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);
    vo.setTour_num5(num5);
    vo.setTour_num6(num6);
    vo.setTour_num7(num7);
    vo.setTour_num8(num8);
    vo.setTour_num9(num9);
    // vo.setTour_num10(num10);
    List<TourVO> result = mainService.getReco1(vo);
    // System.out.println(result);
    return result;
  }
  // 메인 유저 선호 2순위 여행지 타입에 대한 여행지 추천
  @RequestMapping("/preferLoc2Reco")
  @ResponseBody
  public List<TourVO> getReco2(Reco1VO vo) {
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    String num5 = vo.getTour_num5().replaceAll("\\.0$", "");
    String num6 = vo.getTour_num6().replaceAll("\\.0$", "");
    String num7 = vo.getTour_num7().replaceAll("\\.0$", "");
    String num8 = vo.getTour_num8().replaceAll("\\.0$", "");
    String num9 = vo.getTour_num9().replaceAll("\\.0$", "");
    System.out.println("@"+num1);
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);
    vo.setTour_num5(num5);
    vo.setTour_num6(num6);
    vo.setTour_num7(num7);
    vo.setTour_num8(num8);
    vo.setTour_num9(num9);
    List<TourVO> result = mainService.getReco2(vo);
    return result;
  }
  // 메인 유저 선호 3순위 여행지 타입에 대한 여행지 추천
  @RequestMapping("/preferLoc3Reco")
  @ResponseBody
  public List<TourVO> getReco3(Reco1VO vo) {
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    String num5 = vo.getTour_num5().replaceAll("\\.0$", "");
    String num6 = vo.getTour_num6().replaceAll("\\.0$", "");
    String num7 = vo.getTour_num7().replaceAll("\\.0$", "");
    String num8 = vo.getTour_num8().replaceAll("\\.0$", "");
    String num9 = vo.getTour_num9().replaceAll("\\.0$", "");
    // System.out.println(num1);
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);
    vo.setTour_num5(num5);
    vo.setTour_num6(num6);
    vo.setTour_num7(num7);
    vo.setTour_num8(num8);
    vo.setTour_num9(num9);
    List<TourVO> result = mainService.getReco3(vo);
    return result;
  }

  // 메인 유저 선호 2순위 지역에 대한 2순위 여행지 추천
  @RequestMapping("/preferType1Reco")
  @ResponseBody
  public List<TourVO> getRecoType1(Reco1VO vo) {
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    String num5 = vo.getTour_num5().replaceAll("\\.0$", "");
    String num6 = vo.getTour_num6().replaceAll("\\.0$", "");
    String num7 = vo.getTour_num7().replaceAll("\\.0$", "");
    String num8 = vo.getTour_num8().replaceAll("\\.0$", "");
    String num9 = vo.getTour_num9().replaceAll("\\.0$", "");
    // System.out.println(num1);
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);
    vo.setTour_num5(num5);
    vo.setTour_num6(num6);
    vo.setTour_num7(num7);
    vo.setTour_num8(num8);
    vo.setTour_num9(num9);
    List<TourVO> result = mainService.getRecoType1(vo);
    return result;
  }

  // 메인 유저 선호 1순위 지역에 대한 1순위 여행지 추천
  @RequestMapping("/preferType2Reco")
  @ResponseBody
  public List<TourVO> getRecoType2(Reco1VO vo) {
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    String num5 = vo.getTour_num5().replaceAll("\\.0$", "");
    String num6 = vo.getTour_num6().replaceAll("\\.0$", "");
    String num7 = vo.getTour_num7().replaceAll("\\.0$", "");
    String num8 = vo.getTour_num8().replaceAll("\\.0$", "");
    String num9 = vo.getTour_num9().replaceAll("\\.0$", "");
    // System.out.println(num1);
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);
    vo.setTour_num5(num5);
    vo.setTour_num6(num6);
    vo.setTour_num7(num7);
    vo.setTour_num8(num8);
    vo.setTour_num9(num9);
    List<TourVO> result = mainService.getRecoType2(vo);
    return result;
  }

  // 메인 유저 선호 3순위 지역에 대한 3순위 여행지 추천
  @RequestMapping("/preferType3Reco")
  @ResponseBody
  public List<TourVO> getRecoType3(Reco1VO vo) {
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    String num5 = vo.getTour_num5().replaceAll("\\.0$", "");
    String num6 = vo.getTour_num6().replaceAll("\\.0$", "");
    String num7 = vo.getTour_num7().replaceAll("\\.0$", "");
    String num8 = vo.getTour_num8().replaceAll("\\.0$", "");
    String num9 = vo.getTour_num9().replaceAll("\\.0$", "");
    // System.out.println(num1);
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);
    vo.setTour_num5(num5);
    vo.setTour_num6(num6);
    vo.setTour_num7(num7);
    vo.setTour_num8(num8);
    vo.setTour_num9(num9);
    List<TourVO> result = mainService.getRecoType3(vo);
    return result;
  }

  // 후기 게시글의 긍정 부정 판단으로 사용자 선호 지역 중에 여행지 추천
  @RequestMapping("/yesResult")
  @ResponseBody
  public List<TourVO> yesResult(Reco1VO vo) {

    System.out.println(vo);
    String num1 = vo.getTour_num1().replaceAll("\\.0$", "");
    String num2 = vo.getTour_num2().replaceAll("\\.0$", "");
    String num3 = vo.getTour_num3().replaceAll("\\.0$", "");
    String num4 = vo.getTour_num4().replaceAll("\\.0$", "");
    
    vo.setTour_num1(num1);
    vo.setTour_num2(num2);
    vo.setTour_num3(num3);
    vo.setTour_num4(num4);

    List<TourVO> result = mainService.yesResult(vo);
    return result;
  }

  // ajax로 리뷰 달기!!! - 여행지
  @RequestMapping("/touro/tour/reviewInsert")
  @ResponseBody
  public void reviewInsert(TourReviewVO vo) {
    System.out.println("컨트롤러....");
    System.out.println(vo.getUser_id());
    if(vo.getImg_real_name() == null) {
      vo.setImg_real_name("default_profile.png");
    }
    mainService.reviewInsert(vo);

  }

  // 여행지 리뷰 보이기
  @RequestMapping("/touro/tour/selectReview")
  @ResponseBody
  public List<TourReviewVO> selectReview(TourReviewVO vo) {
      // System.out.println("여행번호 : " + vo.getImg_real_name());
      // if(vo.getImg_real_name() == null) {
      //   vo.setImg_real_name("default_profile.png");
      // }
      List<TourReviewVO> result = mainService.reviewSelect(vo);
      System.out.println("이미지 : " + vo.getImg_real_name());
      List<TourReviewVO> review = new ArrayList<TourReviewVO>();
      for(TourReviewVO tourReview : result) {
        System.out.println(tourReview);
        if(tourReview.getImg_real_name().equals("5ee25b671da2a46f118d0a4454d822a5")) {
          tourReview.setImg_real_name(tourReview.getImg_name());
        } else if(tourReview.getImg_real_name() == null) {
          tourReview.setImg_real_name("default_profile.png");
        }
        review.add(tourReview);
      }
      return review;
  }

  // ajax로 리뷰 달기!!! - 여행후기
  @RequestMapping("/touroview/touroviewReviewInsert")
  @ResponseBody
  public void touroviewReviewInsert(TouroviewReviewVO vo) {
    System.out.println("컨트롤러왔어요?");
    System.out.println(vo.getTour_num());
    mainService.touroviewReviewInsert(vo);

  }

  // 여행후기 리뷰 보이기
  @RequestMapping("/touroview/touroviewSelectReview")
  @ResponseBody
  public List<TouroviewReviewVO> touroviewReviewSelect(TouroviewReviewVO vo) {
     //  System.out.println("여행번호 : " + vo.getImg_real_name());
      // if(vo.getImg_real_name() == null) {
      //   vo.setImg_real_name("default_profile.png");
      // }
      System.out.println("후기게시판이미지 : " + vo.getImg_real_name());
      List<TouroviewReviewVO> result = mainService.touroviewReviewSelect(vo);
      List<TouroviewReviewVO> review = new ArrayList<TouroviewReviewVO>();
      for(TouroviewReviewVO touroviewReview : result) {
        System.out.println(touroviewReview);
        if (touroviewReview.getImg_real_name() != null && touroviewReview.getImg_real_name().equals("5ee25b671da2a46f118d0a4454d822a5")) {
          touroviewReview.setImg_real_name(touroviewReview.getImg_name());
      }
        review.add(touroviewReview);
      }
      return review;
  }
  

}
