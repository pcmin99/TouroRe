package com.example.coding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.coding.domain.AdminVO;
import com.example.coding.service.AdminService;

@Controller
public class FooterController {
        
    @Autowired
    private AdminService adminService;

    // adminvo에 웬만한거 다 있어서 동일하게 씀
        @PostMapping(value="/footer")
        @ResponseBody
        public List<AdminVO> footer_tour_list(Model m) {
        List<AdminVO> list = adminService.footer_tour_list();
        m.addAttribute("footerTourList", list);
        return list;
    }

    // 푸터 후기 게시판 좋아요 개수 top 4 list 
    @PostMapping(value="/footerTouroview")
    @ResponseBody
    public List<AdminVO> footer_toroview_list(Model m) {
    List<AdminVO> list = adminService.footer_toroview_list();
    System.out.println("컨트롤러 탑니당");
    m.addAttribute("footerTourList", list);
    return list;
}

}
