package com.spring.ext.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ext.domain.Comment;
import com.spring.ext.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService service;
	
	@PostMapping("/commentinsert")
	public String commentinsert(Comment c) {
		service.commentinsert(c);
		return "redirect:/content?idx="+c.getBoard_num();
	}
	
}
