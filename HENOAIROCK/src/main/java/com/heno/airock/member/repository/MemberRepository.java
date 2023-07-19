package com.heno.airock.member.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MemberDTO;


@Repository
public class MemberRepository {
	
	private final SqlSessionTemplate sql;
	
	public MemberRepository(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	public MemberDTO login(MemberDTO memberDTO) {
    	return sql.selectOne("Member.login", memberDTO);
    }
}
