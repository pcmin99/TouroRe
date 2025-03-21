package com.example.coding.service;

import com.example.coding.domain.ImgVO;
import org.springframework.web.multipart.MultipartFile;

public interface ImgService {

    public void     insertFile(MultipartFile[] files);
    public ImgVO    selectFile(ImgVO vo);
    public Long     selectNum();
    
}