package com.example.coding.service;

import com.example.coding.domain.ImgVO;

public interface ImgService {

    public void     insertFile(ImgVO vo);
    public ImgVO    selectFile(ImgVO vo);
    public Long     selectNum();
    
}