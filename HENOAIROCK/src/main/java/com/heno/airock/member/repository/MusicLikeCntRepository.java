package com.heno.airock.member.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.heno.airock.dto.MusicHeartDTO;
import com.heno.airock.dto.MusicVO;

@Repository
public class MusicLikeCntRepository {
	
	private final SqlSessionTemplate sql;
	
	public MusicLikeCntRepository(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	public MusicVO musicSaveHeart(MusicHeartDTO heartDTO) {
		MusicVO muVO = new MusicVO();
		heartDTO.setMusicId(muVO.getMusicId());
		
		//해당 게시물의 하트 +1
		sql.update("MusicHeart.heart_up", heartDTO);
		
		// music_like_cnt 테이블에 추가
		int result = sql.insert("MusicHeart.heart_save", heartDTO);
		
		if (result == 1) {
			muVO = sql.selectOne("MusicHeart.heart_cnt", muVO);
		}
		
		return muVO;
	}
	
	public MusicVO musicRemoveHeart(MusicHeartDTO heartDTO) {
		MusicVO muVO = new MusicVO();
		heartDTO.setMusicId(muVO.getMusicId());
		
		//해당 게시물의 하트 +1
		sql.update("MusicHeart.heart_down", heartDTO);
		
		// music_like_cnt 테이블에 추가
		int result = sql.insert("MusicHeart.heart_remove", heartDTO);
		
		if (result == 1) {
			muVO = sql.selectOne("MusicHeart.heart_cnt", muVO);
		}
		
		return muVO;
	}
}
