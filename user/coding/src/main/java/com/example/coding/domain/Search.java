package com.example.coding.domain;

public class Search extends Paging{
    private String tour_cate_code;	// 여행지 분류
	private String keyword;			// 검색어
	private String Locs; 			// 지역 코드 
	private String [] loc_cate_code;
	private String Star;
	private String [] tour_star;


    public String getTour_cate_code() {
		return tour_cate_code;
	}

	public void setTour_cate_code(String tour_cate_code) {
		this.tour_cate_code = tour_cate_code;
	}

	public String  getLocs(){
		return Locs;
	}

	public void setLocs(String Locs){
			this.Locs = Locs;
	}

	public String [] getLoc_cate_code(){
		return loc_cate_code;
	}

	public void setLoc_cate_code(String [] loc_cate_code){
			this.loc_cate_code = loc_cate_code;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String  getStar(){
		return Star;
	}

	public void setStar(String Star){
			this.Star = Star;
	}

	public String [] getTour_star(){
		return tour_star;
	}

	public void setTour_star(String [] tour_star){
			this.tour_star = tour_star;
	}
}
