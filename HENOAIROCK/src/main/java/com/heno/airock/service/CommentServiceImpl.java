package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dao.CommentDao;
import com.heno.airock.dto.CommentVO;

@Repository
public class CommentServiceImpl  implements CommentService{
	
	@Autowired
	CommentDao commentDao;

	@Override
	public int save(CommentVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(CommentVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(CommentVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommentVO selectOne(CommentVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CommentVO> select(CommentVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
