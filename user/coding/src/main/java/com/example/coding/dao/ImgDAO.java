package com.example.coding.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.coding.domain.ImgVO;
import com.example.coding.domain.ImgDetailVO;

@Mapper
public interface ImgDAO {

    public void     insertFile(ImgVO vo);
    public void     insertFileDetail(ImgDetailVO vo);

    public ImgVO    selectFile(ImgVO vo);
    public Long     selectNum();
    
}