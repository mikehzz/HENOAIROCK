package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MyPlayListVO;

public interface MyPlaylistDao extends WorkDiv<MyPlayListVO> {
	
	public List<MyPlayListVO> showPlayLists(MyPlayListVO myPlayListVO) throws SQLException;

	public List<MyPlayListVO> useradd(MyPlayListVO myPlayListVO) throws SQLException;
	
	public int saveMusic(MyPlayListVO myPlayListVO) throws SQLException;
	
	public MyPlayListVO selectLikeList(MyPlayListVO myPlayListVO) throws SQLException;

	public int deleteMusic(MyPlayListVO myPlayListVO) throws SQLException;
}
