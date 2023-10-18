package com.spring.ext.domain;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Page {

	private Criteria criteria;
	private int total;
	private int startpage;
	private int endpage;
	private boolean prev,next;
	private int displayPageNum = 5;
	
	public void setTotal(int total) {
		this.total = total;
		calcData();
	}
	
	private void calcData() {
		//		(현재 페이지 / 한페이지에 표시되는 페이지 번호의 개수) * 한페이지에 표시되는 페이지 번호의 개수
		endpage = (int)(Math.ceil(criteria.getPageNum() / (double) displayPageNum) * displayPageNum);
		
		//		(끝 페이지 번호 - 한페이지에 표시되는 페이지 번호의 개수) + 1
		startpage = (endpage - displayPageNum) + 1;
		if(startpage <= 0) startpage = 1;

		//		총 게시글 수 / 한페이지에 표시되는 데이터의 개수
		int realEnd = (int)(Math.ceil(total / (double) criteria.getAmount()));
		if(endpage > realEnd) {
			endpage = realEnd;
		}
		
		//		시작 페이지 번호 == 1 ? 거짓 : 참
		prev = startpage == 1 ? false : true;
		//		끝 페이지 번호 * 한페이지에 표시되는 데이터의 개수 > 총 게시글의 수 ? 참 : 거짓
		next = endpage * criteria.getAmount() < total ? true : false;
	}
}
