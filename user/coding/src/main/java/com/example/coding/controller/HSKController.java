package com.example.coding.controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.example.coding.domain.ImgDetailVO;
import com.example.coding.domain.ImgVO;
import com.example.coding.domain.LikeVO;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.TouroviewDetailVO;
import com.example.coding.domain.TouroviewReviewVO;
import com.example.coding.domain.TouroviewVO;
import com.example.coding.domain.UserVO;
import com.example.coding.service.ImgService;
import com.example.coding.service.TouroviewService;
import com.example.coding.util.MD5Generator;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;




@RequestMapping("/touroview")
@Controller
public class HSKController {

    @Autowired
    private TouroviewService touroviewService;

    @Autowired
    public ImgService imgService;

    
    // -------------------------- touroview_insert
    // 로그인 id 가져오기
    @GetMapping("/touroview_insert")
    public String showTouroviewForm(HttpServletRequest request, Model model) {
        // 세션에서 로그인 정보 가져오기
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("loggedInUser");
        String userId =  user.getUser_id();
        // 로그인 여부 확인
        if (userId == null){
            // 로그인 안 된 경우 로그인 페이지 이동
            return "redirect:/user/login";
        }
        // TouroviewVO 객체에 설정
        TouroviewVO touroviewVO = new TouroviewVO();
        touroviewVO.setUser_id(userId);
        // 모델에 추가
        model.addAttribute("touroviewVO", touroviewVO);
        // 로그인 된 경우 게시글 작성 폼 이동
        session.setAttribute("userId", userId);
        return "touroview/touroview_insert";
    }




    // 후기 게시물 등록
    @PostMapping("/saveTouroview")
    public String saveTouroview(@ModelAttribute("touroviewVO") TouroviewVO touroviewVO, 
                                HttpServletRequest request,
                                @RequestParam(name="files", required = false) MultipartFile[] files) {
            try{
                // 여행 후기 데이터 저장하는 서비스
                touroviewService.saveTouroview(touroviewVO,request);
                // 게시물 번호 완
                int touroview_num = touroviewService.selectViewNum();
                try {
                    if(files != null && files.length > 0 ){
                        for(MultipartFile file : files){
                            if(!isValidFile(file)){
                                return "error" ;
                            }
                        }
                    }
                    imgService.insertFile(files); // service vo 를 처리 하지만 controller에선 files 임 -> files 값을 저장 및 처리 할 생각
                    return "redirect:/touroview/touroview_detail?touroview_num=" + String.valueOf(touroview_num);
                } catch (Exception e) {
                    e.printStackTrace();
                    return "touroview/touroview_insert";
                }
            } catch (Exception e){
                e.printStackTrace();
                return "touroview/touroview_insert";
            }
        }

    private boolean isValidFile(MultipartFile file){
        if(file.isEmpty()){
            return false ;
        }
        String fileName = file.getOriginalFilename() ;
        if(fileName == null){
            return false ;
        }
        String lowerFileName = fileName.toLowerCase();
        List<String> blockedExtensions = Arrays.asList(".exe", ".sh", ".bat", ".js", ".php", ".jsp", ".html", ".dll", ".scr");
        for( String ext : blockedExtensions){
            if(lowerFileName.endsWith(ext)){
                return false ;
            }
        }
        return true ;
    }

    // 페이징 및 list 목록 조회
    @GetMapping("/touroview_list")
    public String showTouroviewList(Model model,
                                    @RequestParam(name = "keyword", required = false) String searchKeyword,
                                    @RequestParam(name = "page", defaultValue = "0") Integer page,
                                    @RequestParam(name = "size", defaultValue = "10") Integer size) {
        
        // Touroview 목록 가져오기
        List<TouroviewVO> touroviewList = touroviewService.getTouroviewList(searchKeyword, page, size);

        // 각 TouroviewVO에 대한 tourVO의 이미지 경로 추가
        for(TouroviewVO touroview : touroviewList){
            TourVO tourVO = touroviewService.getTourByNum(touroview.getTour_num());
            if(tourVO != null){
                touroview.setTour_img1_path(tourVO.getTour_img1_path()); // TouroviewVO에 이미지 경로 설정
            }
        }                                

        // 전체 페이지 수 계산
        int totalPages = touroviewService.getTotalPages(size);

        // 모델에 데이터 추가
        model.addAttribute("touroviewList", touroviewList);
        model.addAttribute("touroviewPage", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("searchKeyword", searchKeyword);

        return "touroview/touroview_list";
    }

        
     // 여행지 검색
     @GetMapping("/searchTouroviewList")
     public String searchTouroviewList(@RequestParam(value = "keyword", required = false) String keyword,
                                         @RequestParam(value = "page", defaultValue = "1") int currentPage,
                                         Model model) {
                                             
        // 페이지 번호가 1보다 작은 경우 1로 설정
        currentPage = Math.max(currentPage, 1);

        // 페이징 처리
        int totalSearchCount = touroviewService.getTotalItemCount(keyword); // 총 아이템 수
        int pageSize = 12; // 페이지당 아이템 수 
        int touroviewPage = (int) Math.floor((double) totalSearchCount / pageSize); // 총 페이지 수
        
        // 페이지 범위를 넘어가지 않도록 처리
        currentPage = Math.min(currentPage, touroviewPage);

        List<TouroviewVO> touroviewList = touroviewService.searchTouroviewList(keyword, currentPage, pageSize);
        model.addAttribute("touroviewList", touroviewList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("touroviewPage", touroviewPage);
        model.addAttribute("currentPage", currentPage);
        return "touroview/touroview_list";
     } 

     @GetMapping("/findByKeyword")
    public ResponseEntity<List<TourVO>> findByKeyword(@RequestParam String keyword) {
        try {
            TourVO vo = new TourVO();
            vo.setKeyword(keyword); // TourVO 객체에 키워드 설정
            List<TourVO> tours = touroviewService.findByKeyword(vo);
            return ResponseEntity.ok(tours); // 검색 결과 반환
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


     // 인기 게시물
     @GetMapping("/popular")
     public ResponseEntity<List<LikeVO>> getPopularTouroview() {
        List<LikeVO> popularTouroview = touroviewService.getPopularTouroview();
        return ResponseEntity.ok(popularTouroview);
    }

        
    // ---------------------------------------------- touroview_detail
    // 해당 사용자가 작성한 게시글 불러오기 (detail 페이지)
    @GetMapping("/touroview_detail")
    public String showTouroviewDetail(@RequestParam(name = "touroview_num") int touroview_num, Model model, HttpSession session) {
            TouroviewVO touroviewVO = touroviewService.getTouroviewById(touroview_num);
            model.addAttribute("touroviewVO", touroviewVO);

            // 후기 정보가 없을 경우 목록 페이지로 리다이렉트
            if (touroviewVO == null){
                return "redirect:/touroview/touroview_list";
            }
            int touroviewNum = Integer.parseInt(touroviewVO.getTour_num());

            // 배경 이미지
            TouroviewDetailVO touroviewImg = touroviewService.getTouroviewImg(touroviewNum);
            model.addAttribute("touroviewImg", touroviewImg);

            // 디테일 이미지 가져오기(3개)
            List<TouroviewDetailVO> detailImg = touroviewService.detailviewImg(touroview_num);
            model.addAttribute("detailImg", detailImg);

            // 후기 정보와 연결된 여행지 정보를 가져오기
            int tourNum = Integer.parseInt(touroviewVO.getTour_num()); 
            TourVO tourVO = touroviewService.getTourByTouroviewId(tourNum);
            

            // 우편번호 000000 처리
            String postNum = tourVO.getTour_postnum();
            if (postNum == null) {
                postNum = "default"; // 기본값 설정
            } else {
                postNum = postNum.replaceAll("\\.0$", "");
            }
            tourVO.setTour_postnum(postNum);


            //UserVO userVO = touroviewService.getUserByTouroviewId(touroview_num);
            TouroviewReviewVO touroviewReviewVO = (TouroviewReviewVO) model.getAttribute("touroviewReviewVO"); //touroviewReview

            // 모델에 데이터 추가
            model.addAttribute("tourVO", tourVO);

            return "touroview/touroview_detail";
    }
        

    @PostMapping("/report")
    @ResponseBody
    public void report(TouroviewVO touroviewVO) {
        touroviewService.insertReportCount(touroviewVO);
    }
    
        
    // ---------------------------------------------- touroview_update_delete
    
    // 후기 게시물 수정
    @GetMapping("/touroview_update_delete")
    public String updateTouroview(@RequestParam(name = "touroview_num") int touroviewNum,  Model model) {
        try{
            // 수정 삭제 페이지에 필요한 데이터 가져오기
            TouroviewVO touroviewVO = touroviewService.getTouroviewById(touroviewNum);
            model.addAttribute("touroviewVO", touroviewVO);

            // TourVO 데이터 가져오기
            TourVO tourVO = touroviewService.getTourNameByTourNum(touroviewVO.getTour_num());
            model.addAttribute("tourVO", tourVO);

            return "touroview/touroview_update_delete";
        }catch (Exception e){
            return "redirect:/touroview/touroview_list";
        }
        
    }

    // 후기 게시물 삭제
    @PostMapping("/deleteTouroview")
    public void deleteTouroview(@RequestParam(name = "touroviewNum") int touroviewNum) {
            touroviewService.deleteTouroview(touroviewNum);
    }



     // 좋아요 추가
    @PostMapping("/addWishList")
    @ResponseBody
	public void addWishList(@ModelAttribute("vo") LikeVO vo){
        touroviewService.addWishList(vo);
	}

    // 좋아요 확인
    @PostMapping("/ckWishList")
    @ResponseBody
	public int ckWishList(@ModelAttribute("vo") LikeVO vo){
		return touroviewService.ckWishList(vo);
	}

    // 좋아요 삭제
    @PostMapping("/deleteWishList")
    @ResponseBody
	public void deleteWishList(@ModelAttribute("vo") LikeVO vo){
		touroviewService.deleteWishList(vo);

	}
  
}