package com.example.coding.domain;

import lombok.Data;

@Data
public class Paging {
    private int listSize = 20; 	// 리스트 수, 페이지당 보여질 리스트 수
	private int rangeSize = 6; // 페이지범위, 페이지 범위에 보여질 버튼 수
	private int page; 			// 현재목록 페이지 번호
	private int range; 			// 각 페이지 범위 시작 번호
	private int listCnt; 		// 전체 개시물 수
	private int pageCnt; 		// 전체 페이지 범위
	private int startPage; 		// 각 페이지 범위 시작 번호
	private int startList; 		// 게시판 시작번호
	private int endPage; 		// 각 페이지 범위 끝 번호
	private boolean prev; 		// 이전 페이지
	private boolean next; 		// 다음 페이지

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;

		// 전체 페이지수
		this.pageCnt = (int) Math.ceil((double) listCnt / listSize);

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;

		// 끝 페이지
		this.endPage = range * rangeSize;

		// 게시판 시작번호
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;

		// 다음 버튼 상태
		this.next = endPage >= pageCnt ? false : true;
		
		if (this.endPage >= this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		
	}
}