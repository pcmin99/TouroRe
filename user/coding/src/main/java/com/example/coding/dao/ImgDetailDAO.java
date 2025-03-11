package com.example.coding.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.coding.domain.ImgDetailVO;

@Mapper
public interface ImgDetailDAO {

    public void             insertFile(ImgDetailVO vo);
    public ImgDetailVO      selectFile(ImgDetailVO vo);
    public void             insertFileMate(ImgDetailVO vo);
    public Long             selectNum();
    public void             insertFileView(ImgDetailVO idvo);
    
}