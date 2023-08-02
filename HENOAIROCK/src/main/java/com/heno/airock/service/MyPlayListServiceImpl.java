package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heno.airock.dao.MyPlaylistDao;
import com.heno.airock.dto.MyPlayListVO;

@Service
public class MyPlayListServiceImpl implements MyPlayListService {
	
	@Autowired
	MyPlaylistDao dao;
	
	@Override
	public int save(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MyPlayListVO selectOne(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyPlayListVO> showPlayList(MyPlayListVO inVO) throws SQLException {
		
		return dao.showPlayList(inVO);
	}

	@Override
	public List<MyPlayListVO> select(MyPlayListVO inVO) throws SQLException {

		return null;
	}

}
