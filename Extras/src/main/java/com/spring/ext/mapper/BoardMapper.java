package com.spring.ext.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.ext.domain.Board;
import com.spring.ext.domain.Criteria;

@Mapper
public interface BoardMapper {

	public List<Board> board();
	
	public List<Board> boardWithPageing(Criteria criteria);
	
	public Board boardContent(int idx);
	
	public void boardinsert(Board b);
	
	public void boarddelete(int idx);
	
	public void boardchu(int idx);
	
	public void boardhits(int idx);
	
	public void boardtcupdate(Board b);
	
	public int boardCount();
	
	public List<Board> boardChart(String fcname);
}
