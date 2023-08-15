package com.heno.airock.dao;

import java.sql.SQLException;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.WorkDiv;
import com.heno.airock.dto.ChatMessageVO;

public interface ChatDao extends WorkDiv<ChatMessageVO>, PcwkLoger {

	int MessageSave(ChatMessageVO inVO) throws SQLException;

}
