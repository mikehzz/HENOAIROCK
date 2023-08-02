package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.MusicDao;
import com.heno.airock.dto.MusicVO;

@Service
public class MusicServiceImpl implements MusicService {

	@Autowired
	MusicDao dao;
	
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
