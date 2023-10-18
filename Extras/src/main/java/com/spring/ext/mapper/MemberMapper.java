package com.spring.ext.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.spring.ext.domain.Member;

@Mapper
public interface MemberMapper {

	public Member gologin(Member m);
	
	public void gojoin(Member m);
	
	public Member profil(String id);
	
	public void updatepw(Member m);
	
	public void updatenick(Member m);
	
	public void withdrawal(Member m);
}
