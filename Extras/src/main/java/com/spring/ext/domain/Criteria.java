package com.spring.ext.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {
	private int pageNum;	//현재페이지
	private int amount;		//한페이지에 표시되는 데이터의 개수
	private String filter;	//필터내용
	private String fname;	//필터항목
	
	public int getPageStart() {		//특정 페이지의 게시글 시작 번호
		return(this.pageNum-1)*amount;
	}
	
	private Criteria(){
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public void setPageNum(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
	}
	
	public void setAmount(int pageCount) {
		int cnt = this.amount;
		if(pageCount != cnt) {
			this.amount = cnt;
		}else {
			this.amount = pageCount;
		}
	}
}
