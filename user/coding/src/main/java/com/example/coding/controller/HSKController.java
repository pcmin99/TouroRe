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
import jakarta.transaction.Transactional;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Collections;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMethod;




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
                                HttpServletRequest request, Model model, 
                                @RequestParam(name="files", required = false) MultipartFile[] files) {
            try{
                // 여행 후기 데이터를 저장하는 서비스 메소드 호출
                System.out.println("여행지:" + touroviewVO.getTouroview_title()); // 콘솔 찍어보기 여행지
                System.out.println("유저 아이디:" + touroviewVO.getUser_id()); // 콘솔 찍어보기 아이디
                System.out.println(touroviewVO);

                // 세션에서 로그인 정보 가져오기
                HttpSession session = request.getSession();
                String userId = (String) session.getAttribute("loggedId");

                // 사용자 아이디 설정
                touroviewVO.setUser_id(userId);

                // 여행 후기 데이터 저장하는 서비스 메소드 호출
                touroviewService.saveTouroview(touroviewVO);

                // 게시물 번호
                int touroview_num = touroviewService.selectViewNum();

                // 파일 업로드 처리
                try {
                    if (files != null && files.length > 0) {
                        try{
                            for (MultipartFile file : files) {
                                // 각 파일에 대한 처리 로직 추가
                                // 예를 들어, 파일을 저장하거나 다른 작업을 수행할 수 있습니다.
                                String img_name = file.getOriginalFilename();
                                System.out.println("originFilename : " + img_name);
                                String img_real_name = new MD5Generator(img_name).toString();
            
                                // 시스템으로 자동으로 잡아주는 경로 설정
                                // 생성되는 폴더의 위치를 확인 후 추후 변경
                                // => static 폴더 밑으로 이동해야 사용자가 그 파일에 접근 가능
                                String save_path = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\assets\\images\\touroviewImg";
                                if( !new File(save_path).exists() ){
                                    new File(save_path).mkdir();
                                } 
                                String img_path = save_path + "\\" + img_real_name;
                                System.out.println("filepath : " + img_path);
            
                                // 파일저장
                            
                                file.transferTo(new File(img_path));
                                
                                
                                // 디비저장을 위해서 파일정보 덩어리 만들기
                                ImgVO ivo = new ImgVO();
                                ivo.setImg_name(img_name);
                                ivo.setImg_real_name(img_real_name);
                                ivo.setImg_path(img_path);
                                System.out.println("<<<<< 파일정보 덩어리 만들기 성공 >>>>>");
            
                                imgService.insertFile(ivo);
                                System.out.println("insertFile() 요청");
            
                                // 파일정보 img_detail에 담기
                                ImgDetailVO idvo = new ImgDetailVO();
                                // idvo.setUser_id(vo.getUser_id());
                                idvo.setImg_num(imgService.selectNum());
                                idvo.setTouroview_num(touroview_num);
                                System.out.println(idvo.getTouroview_num());
                                touroviewService.insertFileView(idvo);
                                System.out.println("아이디 : " + idvo.getTouroview_num()+"이미지번호 : " + idvo.getImg_num());
                            }
                        }catch(Exception e) {
                            System.out.println("file error" + e);
                        }
                    }
                } catch (Exception e) {
                        System.out.println("file2 error");
                                
                }


                // 성공 시 리다이렉트
                return "redirect:/touroview/touroview_detail?touroview_num=" + String.valueOf(touroview_num); // 저장 후 목록 페이지로 리다이렉트
            } catch (Exception e){
                // 저장 중 오류 발생
                e.printStackTrace();
                return "touroview/touroview_insert";
            }
        }

        
    // ---------------------------------------------- touroivew_list
    
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
        
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalSearchCount);

        List<TouroviewVO> touroviewList = touroviewService.searchTouroviewList(keyword, currentPage, pageSize);
        model.addAttribute("touroviewList", touroviewList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("touroviewPage", touroviewPage);
        model.addAttribute("currentPage", currentPage);                                   
 
        System.err.println("게시물 :" + touroviewList);
        System.out.println("키워드 :" + keyword);

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
        
            // 로그인 된 사용자 아이디 확인
            // String loggedInUserId = (String) session.getAttribute("loggedId");
            // UserVO user = (UserVO) session.getAttribute("loggedInUser");
            // String loggedInUserId =  user.getUser_id();

            // if(loggedInUserId != null) {

            // }
            TouroviewVO touroviewVO = touroviewService.getTouroviewById(touroview_num);

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
            String postNum = tourVO.getTour_postnum().replaceAll("\\.0$", "");
            tourVO.setTour_postnum(postNum); // tourVO에 postNum 넣기

            UserVO userVO = touroviewService.getUserByTouroviewId(touroview_num);
            TouroviewReviewVO touroviewReviewVO = (TouroviewReviewVO) model.getAttribute("touroviewReviewVO"); //touroviewReview


            // 모델에 데이터 추가
            model.addAttribute("touroviewVO", touroviewVO);
            model.addAttribute("tourVO", tourVO);
            model.addAttribute("userVO", userVO);



            // 자신이 작성한 게시글인 경우 모델에 플래그 추가
            // boolean isAuthor = loggedInUserId != null && loggedInUserId.equals(touroviewVO.getUser_id());
            // model.addAttribute("isAuthor", isAuthor);

            return "touroview/touroview_detail";
            // touroviewNum에 해당하는 후기를 서비스를 통해 불러와서 모델에 추가
            
        
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
            // 오류 처리
            e.printStackTrace();
            return "redirect:/touroview/touroview_list";
        }
        
    }
    // // 수정
    // @PostMapping("/touroview_update_delete")
    // public String handleUpdateDeleteAction(@ModelAttribute TouroviewVO touroviewVO,
    //                                         @RequestParam("files") MultipartFile[] files,
    //                                         RedirectAttributes redirectAttrs){
    //     try {

    //         touroviewService.updateTouroview(touroviewVO);

    //         // 파일 업로드 처리 ImgVO 정보 업데이트
    //         for (MultipartFile file : files) {
    //             if (!file.isEmpty()) {
    //                 // 파일 저장 로직 구현 (여기서는 가상의 메소드 saveFile을 호출)
    //                 String filePath = saveFile(file);
    //                 String fileName = file.getOriginalFilename();
    
    //                 // ImgVO 객체 생성 및 설정
    //                 ImgVO imgVO = new ImgVO();
    //                 imgVO.setTouroview_num(touroviewVO.getTouroview_num()); // 게시물 번호 설정
    //                 imgVO.setImg_name(fileName); // 파일 이름 설정
    //                 imgVO.setImg_path(filePath); // 파일 경로 설정
    
    //                 // 데이터베이스에 이미지 정보 업데이트
    //                 touroviewService.UpdateImgDetail(imgVO);
    //             }
    //         }

    //         redirectAttrs.addFlashAttribute("successMessage", "게시물이 성공적으로 수정되었습니다.");
    //         return "redirect:/touroview/touroview_list";
    //     } catch (Exception e) {
    //         // 필요한 대로 예외 처리
    //         e.printStackTrace();
    //         redirectAttrs.addFlashAttribute("errorMessage", "게시물 수정 중 오류가 발생했습니다.");
    //         return "redirect:/touroview/touroview_update_delete?touroview_num=" + touroviewVO.getTouroview_num();
    //     }

    // }


    // // 파일을 저장하고 저장된 파일의 경로를 반환하는 메서드
    // private String saveFile(MultipartFile file) throws IOException {
    //     // 저장할 디렉토리 경로 설정 (이 경로는 실제 서버 환경에 맞게 설정해야 함)
    //     String uploadDir = "여기에_파일을_저장할_서버_경로를_지정";

    //     // 파일명 생성 로직 (중복 방지를 위해 시스템 시간을 활용할 수 있음)
    //     String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

    //     // 파일 저장 경로 생성
    //     Path savePath = Paths.get(uploadDir + File.separator + fileName);

    //     // 파일 저장
    //     Files.copy(file.getInputStream(), savePath, StandardCopyOption.REPLACE_EXISTING);

    //     // 저장된 파일의 전체 경로를 문자열로 반환
    //     return savePath.toString();
    // }
    





    // 후기 게시물 삭제
    @PostMapping("/deleteTouroview")
    public ResponseEntity<String> deleteTouroview(@RequestParam(name = "touroviewNum") int touroviewNum) {
        try {
            touroviewService.deleteTouroview(touroviewNum);
            return ResponseEntity.ok("삭제가 완료되었습니다.");
        } catch (Exception e) {
            // 삭제 실패 시 예외 처리와 함께 오류 응답을 반환
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 중 오류가 발생했습니다.");
        }
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
		int res = touroviewService.ckWishList(vo);
        System.out.println("Res값!!:>>>>>> " + res);
		return res;
	}

    // 좋아요 삭제
    @PostMapping("/deleteWishList")
    @ResponseBody
	public String deleteWishList(@ModelAttribute("vo") LikeVO vo){
		int result = touroviewService.deleteWishList(vo);
        System.out.println("result >>>>!!! >>>> " + result);
		System.out.println(result);
		if (result == 1) {
			return "ok";
		} else {
			return "no";
		}
		
	}
  
}