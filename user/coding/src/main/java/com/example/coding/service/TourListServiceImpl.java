package com.example.coding.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

import com.example.coding.dao.TourListDAO;
import com.example.coding.domain.InquiryVO;
import com.example.coding.domain.Search;
import com.example.coding.domain.TourVO;
import com.example.coding.domain.WishListVO;

@Service
public class TourListServiceImpl implements TourListService{
    
    @Autowired
    private TourListDAO tourListDAO;

    @Override
    public List<TourVO> getTourList(Search search){
        return tourListDAO.getTourList(search);
    }

    @Override
    public int getBoardListCnt(Search search) {
        return tourListDAO.getBoardListCnt(search);
    }

    @Override
    public TourVO getTourData(TourVO vo) {

        return tourListDAO.getTourData(vo);
    }

    @Override
    public String addWishList(WishListVO vo) {
        return tourListDAO.addWishList(vo);

    }

    @Override
    public String ckWishList(WishListVO vo) {
        return tourListDAO.ckWishList(vo);
    }

    @Override
    public int deleteWishList(WishListVO vo) {
        try{
            return tourListDAO.deleteWishList(vo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String newInquiry(InquiryVO vo) {
        try{
            return tourListDAO.newInquiry(vo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }


}
