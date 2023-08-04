package com.heno.airock.dao;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MyPlayListVO;

public interface MyPlaylistDao extends WorkDiv<MyPlayListVO> {
	
	public List<MyPlayListVO> showPlayList(MyPlayListVO myPlayListVO) throws SQLException;
	
	public List<MyPlayListVO> showPlayLists(MyPlayListVO myPlayListVO) throws SQLException;

	
}
