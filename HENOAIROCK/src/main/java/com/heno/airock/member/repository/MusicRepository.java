package com.heno.airock.member.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MusicRepository {
	
	private final SqlSessionTemplate sql;
	
	public MusicRepository(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
}
