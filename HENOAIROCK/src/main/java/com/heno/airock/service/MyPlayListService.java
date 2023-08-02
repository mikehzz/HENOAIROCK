package com.heno.airock.service;

import java.sql.SQLException;
import java.util.List;

import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.MyPlayListVO;

public interface MyPlayListService extends WorkDiv<MyPlayListVO>{

	public List<MyPlayListVO> showPlayList(MyPlayListVO inVO) throws SQLException;
	
}
