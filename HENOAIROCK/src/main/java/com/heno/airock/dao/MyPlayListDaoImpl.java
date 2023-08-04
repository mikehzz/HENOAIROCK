package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MyPlayListVO;

@Repository
public class MyPlayListDaoImpl implements MyPlaylistDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
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
	public List<MyPlayListVO> select(MyPlayListVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MyPlayListVO> showPlayList(MyPlayListVO myPlayListVO) throws SQLException {
		
		return sqlSessionTemplate.selectList("MyPlayList.select", myPlayListVO);
	}
	
	@Override
	public List<MyPlayListVO> showPlayLists(MyPlayListVO myPlayListVO) throws SQLException {
		
		return sqlSessionTemplate.selectList("MyPlayList.selectList", myPlayListVO);
	}	

}
