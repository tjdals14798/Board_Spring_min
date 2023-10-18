package com.spring.ext.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ext.domain.Comment;
import com.spring.ext.mapper.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper mapper;
	
	public List<Comment> comment(int idx) {
		return mapper.comment(idx);
	}
	
	public void commentinsert(Comment c) {
		mapper.commentinsert(c);
	}
	
	public void commentChu(int idx) {
		mapper.commentChu(idx);
	}
	
	public void commentDel(int idx) {
		mapper.commentDel(idx);
	}
}
