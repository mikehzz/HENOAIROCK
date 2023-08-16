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
		return sqlSessionTemplate.insert("MyPlayList.LikeListSave", inVO);
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
		
		return sqlSessionTemplate.selectList("MyPlayList.likeList", inVO);
	}

	
	@Override
	public List<MyPlayListVO> showPlayLists(MyPlayListVO myPlayListVO) throws SQLException {
		
		return sqlSessionTemplate.selectList("MyPlayList.selectList", myPlayListVO);
	}

	@Override
	public List<MyPlayListVO> useradd(MyPlayListVO myPlayListVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveMusic(MyPlayListVO inVO) throws SQLException {
		return sqlSessionTemplate.insert("MyPlayList.saveLikeMusic", inVO);
	}

	@Override
	public MyPlayListVO selectLikeList(MyPlayListVO inVO) throws SQLException {
		return sqlSessionTemplate.selectOne("MyPlayList.selectLikeSeq", inVO);
	}
	
	@Override
	public int deleteMusic(MyPlayListVO inVO) throws SQLException {
		
		return sqlSessionTemplate.delete("MyPlayList.deleteLikeMusic", inVO);
	}
	

}
