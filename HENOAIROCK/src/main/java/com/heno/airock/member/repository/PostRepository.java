package com.heno.airock.member.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.PostDTO;

@Repository
public class PostRepository {
	private final SqlSessionTemplate sql;
	
	public PostRepository(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	public int save(PostDTO postDTO) {
		return sql.insert("Post.save", postDTO);
	}
	
	public int delete(PostDTO postDTO) {
		return sql.delete("Post.delete", postDTO);
	}
	
	public int update(PostDTO postDTO) {
		return sql.update("Post.update", postDTO);
	}
	public List<PostDTO> select(PostDTO postDTO) {
		return sql.selectList("Post.select", postDTO);
	}
}
