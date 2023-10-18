package com.spring.ext.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ext.domain.Member;
import com.spring.ext.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@PostMapping("/gologin")
	public String gologin(Member m, HttpSession session, Model model, RedirectAttributes rttr) {
		Member mem = service.gologin(m);
		if(mem != null) {
			session.setAttribute("id", mem.getId());
			session.setAttribute("nick", mem.getNick());
			System.out.println("성공");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg","로그인 실패");
			return "redirect:/login"; 
		} 
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/profil")			//마이 페이지
	public String profil(@RequestParam("id") String id, Model model) {
		if(id.equals("admin")) {
			return "adminview";
		}else {
			model.addAttribute("profil", service.profil(id));
			return "profilview";
		}
	}
	
	@PostMapping("/updatepw")		//비밀번호 변경
	public String updatepw(Member m, HttpServletRequest request) {
		String ref = request.getHeader("referer");
		service.updatepw(m);
		return "redirect:"+ref;
	}
	
	@PostMapping("/withdrawal") 	//회원 탈퇴
	public String withdrawal(Member m, HttpSession session) {
		service.withdrawal(m);
		session.invalidate();
		return "redirect:/";
	}
	
	@PostMapping("/updatenick")		//닉네임 변경
	public String updatenick(Member m, HttpServletRequest request, HttpSession session) {
		String ref = request.getHeader("referer");
		service.updatenick(m);
		session.setAttribute("nick", m.getNick());
		return "redirect:"+ref;
	}
	
	@PostMapping("/gojoin")
	public String gojoin(@Valid Member m, Errors errors, RedirectAttributes rttr) {
		if(errors.hasErrors()) {
			rttr.addFlashAttribute("joinInfo", m);
			
			Map<String, String> vResult = service.vHandling(errors);
			for(String key : vResult.keySet()) {
				rttr.addAttribute(key, vResult.get(key));
			}
			rttr.addFlashAttribute("jmsg", "가입실패");
			return "redirect:/login";
		}
		
		try {
			service.gojoin(m);	
		}catch (Exception e) {
			System.out.println("실패");
			rttr.addFlashAttribute("jmsg","가입실패");
			return "redirect:/login";
		}
			rttr.addAttribute("jmsg", "가입성공");
		return "redirect:/login";
	}
}
