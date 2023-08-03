package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MusicVO;

@Repository
public class MusicDaoImpl implements MusicDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int save(MusicVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(MusicVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MusicVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MusicVO selectOne(MusicVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MusicVO> select(MusicVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
