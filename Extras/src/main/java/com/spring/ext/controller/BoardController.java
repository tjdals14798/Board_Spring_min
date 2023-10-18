package com.spring.ext.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ext.domain.Board;
import com.spring.ext.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/boarddelete")			//게시글 삭제
	public String boarddelete(@RequestParam("idx")int idx) {
		service.boarddelete(idx);
		return "redirect:/";
	}
	
	@GetMapping("/boardchu")			//게시글 추천
	public String boardchu(@RequestParam("idx")int idx) {
		service.boardchu(idx);
		return "redirect:/content?idx="+idx;
	}
	
	@PostMapping("/boardtcupdate")		//게시글 업데이트
	public String boardtcupdate(Board b) {
		service.boardtcupdate(b);
		return "redirect:/content?idx="+b.getIdx();
	}
}
