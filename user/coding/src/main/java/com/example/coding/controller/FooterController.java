package com.example.coding.controller;

import java.util.List;

import com.example.coding.domain.FooterTourListVO;
import com.example.coding.domain.FooterTouroViewVO;
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


        @PostMapping(value="/footer")
        @ResponseBody
        public List<FooterTourListVO> footer_tour_list(Model m) {
        List<FooterTourListVO> list = adminService.footer_tour_list();
        m.addAttribute("footerTourList", list);
        return list;
        }

    // 푸터 후기 게시판 좋아요 개수 top 4 list 
    @PostMapping(value="/footerTouroview")
    @ResponseBody
    public List<FooterTouroViewVO> footer_toroview_list(Model m) {
    List<FooterTouroViewVO> list = adminService.footer_toroview_list();
    m.addAttribute("footerTourList", list);
    return list;
}

}
