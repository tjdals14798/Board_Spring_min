package com.spring.ext.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.ext.domain.Board;
import com.spring.ext.domain.Comment;
import com.spring.ext.domain.Criteria;
import com.spring.ext.domain.Page;
import com.spring.ext.service.BoardService;
import com.spring.ext.service.CommentService;
import com.spring.ext.service.MemberService;

@RestController
public class RestHomeController {
	@Autowired
	private BoardService bservice;
	@Autowired
	private CommentService cservice;
	@Autowired
	private MemberService mservice;
	
	@GetMapping("/api/comment")
	public List<Comment> comment(int idx){
		return cservice.comment(idx);
	}
	
	@PostMapping("/api/boardinsert")
	public void boardinsert(Board b) {
		bservice.boardinsert(b);
	}
	
	@GetMapping("api/commentchu")
	public void commentChu(int idx) {
		cservice.commentChu(idx);
	}
	
	@GetMapping("api/commentdel")
	public void commentDel(int idx) {
		cservice.commentDel(idx);
	}
	
	@GetMapping("api/boardchart")
	public List<Board> boardChart(String fcname){
		return bservice.boardChart(fcname);
	}
	
}
