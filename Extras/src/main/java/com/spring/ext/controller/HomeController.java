package com.spring.ext.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ext.domain.Board;
import com.spring.ext.domain.Criteria;
import com.spring.ext.domain.Page;
import com.spring.ext.service.BoardService;


@Controller
public class HomeController {
	@Autowired
	BoardService service;
	
	@GetMapping("/")
	public String Home(Criteria criteria, Model model){
		Page page = new Page();
		page.setCriteria(criteria);
		
		if (criteria.getFname() == null || criteria.getFname().equals("")) { /* 필터링유무 */
			page.setTotal(service.boardCount());
		} else {
			page.setTotal(10);
		}
		
		model.addAttribute("list", service.boardWithPageing(criteria));
		model.addAttribute("pageMaker",page);
		return "mainP";
	}
	
	@GetMapping("/content") 		//게시글 1개
	public String boardContent(@RequestParam("idx")int idx, Model model) {
		service.boardhits(idx);
		Board b = service.boardContent(idx);
		model.addAttribute("content",b); 
		return "postview"; 
	}
	
	@GetMapping("/login")
	public String Login() {
		return "login";
	}
	
}
