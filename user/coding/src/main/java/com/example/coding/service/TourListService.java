package com.example.coding.service;

import java.util.List;

import com.example.coding.domain.InquiryVO;
import com.example.coding.domain.Search;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.WishListVO;

public interface TourListService {
    
    public List<TourVO> getTourList(Search search);
    public int getBoardListCnt(Search search);
    public TourVO getTourData(TourVO vo);
    public String addWishList(WishListVO vo);
    public String ckWishList(WishListVO vo);
    public String newInquiry(InquiryVO vo);
    public int deleteWishList(WishListVO vo);
}
