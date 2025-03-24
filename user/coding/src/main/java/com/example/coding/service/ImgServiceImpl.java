package com.example.coding.service;

import com.example.coding.dao.*;
import com.example.coding.domain.ImgDetailVO;
import com.example.coding.util.MD5Generator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.coding.domain.ImgVO;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Service
public class ImgServiceImpl implements ImgService {

    @Autowired
    ImgDAO imgDAO;

    @Autowired
    ImgDetailDAO imgDetailDAO;

    @Autowired
    TouroviewDAO touroviewDAO ;

    @Autowired
    TouroMateDAO touroMateDAO ;

    @Autowired
    UserDAO userDAO ;



    // catch 부분을 어떻게 처리할 것인지 고민해야함 -> 트래픽 처리를 위해
    // 예외 상황 발생시 예외를 JSON데이터로 변환하여 프론트에 에러 도출( 에러 화면 제작 or alert 띄우는등 방식
    @Override
    public void insertFile(MultipartFile[] files ){

        int touroview_num = touroviewDAO.selectViewNum() ;
        int touro_mate_num = touroMateDAO.selectMateNum();

        for(MultipartFile file : files){

            try {
                String defaultProfileImagePath = "" ;
                String img_name = file.getOriginalFilename();
                String img_real_name = new MD5Generator(img_name).toString();
                String save_path = System.getProperty("user.dir")+"\\\\src\\\\main\\\\resources\\\\static\\\\assets\\\\images\\\\touroviewImg" ;
                if( !new File(save_path).exists() ){
                    new File(save_path).mkdir();
                }
                String img_path = save_path + "\\" + img_real_name ;
                file.transferTo(new File(img_path));


                ImgVO vo = new ImgVO();
                vo.setImg_name(img_name);
                vo.setImg_real_name(img_real_name);
                vo.setImg_path(img_path);
                imgDAO.insertFile(vo);

                ImgDetailVO idvo = new ImgDetailVO();
                idvo.setImg_num(selectNum());

                if(touroview_num > 0){
                    idvo.setTouroview_num(touroview_num);
                    imgDetailDAO.insertFileView(idvo);
                }
                else if(touro_mate_num > 0){
                    idvo.setTouro_mate_num(touro_mate_num);
                    imgDetailDAO.insertFileMate(idvo);
                }
                else{
                    imgDetailDAO.insertFileMate(idvo);
                }
                
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }


    };
    
    @Override
    public ImgVO selectFile(ImgVO vo){
        return imgDAO.selectFile(vo);
    };

    @Override
    public Long selectNum(){
        return imgDAO.selectNum();
    };
}
