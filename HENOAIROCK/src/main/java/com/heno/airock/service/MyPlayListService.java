package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MyPlayListVO;

public interface MyPlayListService extends WorkDiv<MyPlayListVO>{

	public List<MyPlayListVO> showPlayLists(MyPlayListVO inVO) throws SQLException;
	
	public int saveMusic(MyPlayListVO inVO) throws SQLException;
	
	public MyPlayListVO selectLikeSeq(MyPlayListVO inVO) throws SQLException;
	
	public int deleteMusic(MyPlayListVO inVO) throws SQLException;

}