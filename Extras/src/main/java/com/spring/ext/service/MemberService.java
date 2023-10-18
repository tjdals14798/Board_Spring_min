package com.spring.ext.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.spring.ext.domain.Member;
import com.spring.ext.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	MemberMapper mapper;
	
	public Member gologin(Member m) {
		return mapper.gologin(m);
	}
	
	public void gojoin(Member m) {
		mapper.gojoin(m);
	}
	
	public Member profil(String id) {	//개인정보 페이지
		return mapper.profil(id);
	}
	
	public void updatepw(Member m) {
		mapper.updatepw(m);
	}
	
	public void updatenick(Member m) {
		mapper.updatenick(m);
	}
	
	public void withdrawal(Member m) {	//회원탈퇴
		mapper.withdrawal(m);
	}
	
	//				회원가입 유효성				//
	@Transactional(readOnly = true)
	public Map<String, String> vHandling(Errors errors){
		Map<String, String> vResult = new HashMap<>();
		
		for(FieldError error : errors.getFieldErrors()) {
			String vName = String.format("valid_%s", error.getField());
			vResult.put(vName, error.getDefaultMessage());
		}
		return vResult;
	}
}
