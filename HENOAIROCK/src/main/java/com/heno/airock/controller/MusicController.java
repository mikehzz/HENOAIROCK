package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.MusicVO;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.CodeService;
import com.heno.airock.service.MusicService;

@Controller
@RequestMapping("/music")
public class MusicController implements PcwkLoger{

	@Autowired
	MusicService musicService;
	
	@Autowired
	CodeService codeService;

	public MusicController() {}

	@GetMapping("/select")
	public String select(@ModelAttribute PostVO inVO, Model model, HttpSession httpSession) throws SQLException {
		String view = "/music/music";
		
		return view;
	}
	
	//음악 순위 게시판
	@GetMapping("/music_rank")
	public String music_rank(MusicVO inVO, Model model) throws SQLException {
		String viewPage = "/music/music_rank";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		List<MusicVO> musicList = this.musicService.selectRank(inVO);
		
		model.addAttribute("musicList", musicList);
		model.addAttribute("inVO", inVO);
		
		return viewPage;
		
	}
	
	
	@GetMapping("")
	public String select(@RequestParam(value = "genre", 
		    required = false) String genre, MusicVO inVO, Model model) throws SQLException {
		String viewPage = "/music/music";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(50);
		}

		// searchWord
		if (null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord("");
		}

		// searchDiv
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv("");
		}
		
		// genre
		if (null != inVO && null != genre) {
			inVO.setGenre(genre);
		}
		LOG.debug("inVO:" + inVO);
		// 코드조회: 검색코드
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeId("MUSIC_SEARCH");
		List<CodeVO> searchList = codeService.select(codeVO);
		model.addAttribute("searchList", searchList);
		
		
		List<MusicVO> musicList = this.musicService.select(inVO);
		model.addAttribute("musicList", musicList);
		
		//총글수
		int totalCnt = 0;
		if(null !=musicList && musicList.size() >0 ) {
			totalCnt = musicList.get(0).getTotalCnt();
		}
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("inVO", inVO);
		return viewPage;
	}

}