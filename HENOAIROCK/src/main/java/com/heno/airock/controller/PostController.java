package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.StringUtil;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.PostVO;
import com.heno.airock.service.CodeService;
import com.heno.airock.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController implements PcwkLoger {
	
	@Autowired
	PostService postService;
	
	@Autowired
	CodeService codeService;
	
	public PostController() {
	}
	
	@GetMapping("/select")
	public String select(PostVO inVO, Model model, HttpSession httpSession) throws SQLException {
		String view = "";
		
		return view;
	}
	
	
	@GetMapping("")
	public String select(@ModelAttribute PostVO inVO, Model model) throws SQLException {
		String viewPage = "post";
		// page번호
		if (null != inVO && inVO.getPageNo() == 0) {
			inVO.setPageNo(1);
		}

		// pageSize
		if (null != inVO && inVO.getPageSize() == 0) {
			inVO.setPageSize(10);
		}

		// searchWord
		if (null != inVO && null == inVO.getSearchWord()) {
			inVO.setSearchWord("");
		}

		// searchDiv
		if (null != inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv("");
		}
		LOG.debug("inVO:" + inVO);
		// 코드조회: 검색코드
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeId("BOARD_SEARCH");
		List<CodeVO> searchList = codeService.select(codeVO);
		model.addAttribute("searchList", searchList);
		
		//코드조회: 페이지 사이즈
		codeVO.setCodeId("CMN_PAGE_SIZE");
		List<CodeVO> pageSizeList = codeService.select(codeVO);
		model.addAttribute("pageSizeList", pageSizeList);
		
		List<PostVO> postList = this.postService.select(inVO);
		model.addAttribute("postList", postList);
		
		//총글수
		int totalCnt = 0;
		if(null !=postList && postList.size() >0 ) {
			totalCnt = postList.get(0).getTotalCnt();
		}
		
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("inVO", inVO);
		return viewPage;
	}
	
	@PostMapping("/save")
	@ResponseBody
	public String save(PostVO inVO) throws SQLException {
		String jsonString = "";
		// 제목 미입력 오류코드 10
		if (null != inVO && inVO.getPost_title().equals("")) {
			return StringUtil.validMessageTOJson("10", "제목을 입력 하세요.");
		}
		
		// 등록자:20
		if (null != inVO && inVO.getUser_id().equals("") && null == inVO.getUser_id()) {
			return StringUtil.validMessageTOJson("20", "등록자를 입력 하세요");
		}
	
		// 내용:30
		if (null != inVO && inVO.getPost_contents().equals("")) {
			return StringUtil.validMessageTOJson("30", "내용을 입력 하세요");
		}
		// 서비스 호출
		int flag = this.postService.save(inVO);
		String message = "";
		if (1 == flag) {// 등록 성공
			message = inVO.getPost_title() + " 등록 성공";
		} else {// 등록실패
			message = inVO.getPost_title() + " 등록실패";
		}
		
		jsonString = StringUtil.validMessageTOJson(flag + "", message);
		
		return jsonString;
	}


}

