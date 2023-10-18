package com.spring.ext.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ext.domain.Board;
import com.spring.ext.domain.Criteria;
import com.spring.ext.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper mapper;
	
	public List<Board> board() {
		return mapper.board();
	}
	
	public List<Board> boardWithPageing(Criteria criteria){
		return mapper.boardWithPageing(criteria);
	}
	
	public Board boardContent(int idx) {
		return mapper.boardContent(idx);
	}
	
	public void boardinsert(Board b) {
		mapper.boardinsert(b);
	}
	
	public void boarddelete(int idx) {
		mapper.boarddelete(idx);
	}
		
	public void boardtcupdate(Board b) {
		mapper.boardtcupdate(b);
	}
	
	public void boardchu(int idx) {
		mapper.boardchu(idx);
	}
	
	public void boardhits(int idx) {
		mapper.boardhits(idx);
	}
	
	public int boardCount() {
		return mapper.boardCount();
	}
	
	public List<Board> boardChart(String fcname) {
		return mapper.boardChart(fcname);
	}
}
