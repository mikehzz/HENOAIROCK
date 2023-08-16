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
		return dao.save(inVO);
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
	public List<MyPlayListVO> showPlayLists(MyPlayListVO inVO) throws SQLException {
		
		return dao.showPlayLists(inVO);
	}

	@Override
	public List<MyPlayListVO> select(MyPlayListVO inVO) throws SQLException {
		return dao.select(inVO);
	}

	@Override
	public int saveMusic(MyPlayListVO inVO) throws SQLException {
		return dao.saveMusic(inVO);
	}

	@Override
	public MyPlayListVO selectLikeSeq(MyPlayListVO inVO) throws SQLException {
		return dao.selectLikeList(inVO);
	}
	
	@Override
	public int deleteMusic(MyPlayListVO inVO) throws SQLException {
		return dao.deleteMusic(inVO);
	}
	

}
