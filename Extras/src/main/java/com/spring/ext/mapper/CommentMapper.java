package com.spring.ext.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.ext.domain.Comment;

@Mapper
public interface CommentMapper {
	
	public List<Comment> comment(int idx);
	
	public void commentinsert(Comment c);

	public void commentChu(int idx);
	
	public void commentDel(int idx);
}
