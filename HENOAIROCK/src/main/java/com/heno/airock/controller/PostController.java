package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.cmn.StringUtil;
import com.heno.airock.dto.CodeVO;
import com.heno.airock.dto.MemberDTO;
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
	public String select(@ModelAttribute PostVO inVO, Model model, HttpServletRequest reqeust, HttpSession session)
			throws SQLException {
		String view = "/post/post_mng";

		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doSelectOne                   │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");

		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setPostSeq(reqeust.getParameter("seq"));
			inVO.setUserId(memberDTO.getUserId());
			PostVO outVO = postService.selectOne(inVO);

			model.addAttribute("outVO", outVO);
			model.addAttribute("inVO", inVO);

			return view;
		} else {
			return "redirect:/member/login";
		}

	}

	@PostMapping("/update")
	public String update(PostVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doUpdate                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = this.postService.update(inVO);
		String message = "";
		if (1 == flag) {
			message = inVO.getPostTitle() + "이 수정 되었습니다.";
		} else {
			message = "수정 실패";
		}
		jsonString = StringUtil.validMessageTOJson(flag + "", message);
		LOG.debug("│jsonString                          │" + jsonString);
		return jsonString;
	}

	@RequestMapping(value = "")
	public String select(PostVO inVO, Model model) throws SQLException {
		String viewPage = "/post/post";
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

		// postDiv
		if (null != inVO && null == inVO.getPostDiv()) {
			inVO.setPostDiv("10");
		}

		LOG.debug("inVO:" + inVO);
		// 코드조회: 검색코드
		CodeVO codeVO = new CodeVO();
		codeVO.setCodeId("BOARD_SEARCH");
		List<CodeVO> searchList = codeService.select(codeVO);
		model.addAttribute("searchList", searchList);

		// 코드조회: 페이지 사이즈
		codeVO.setCodeId("CMN_PAGE_SIZE");
		List<CodeVO> pageSizeList = codeService.select(codeVO);
		model.addAttribute("pageSizeList", pageSizeList);

		List<PostVO> list = postService.select(inVO);
		LOG.debug("list:" + list);
		model.addAttribute("list", list);

		// 총글수
		int totalCnt = 0;
		if (null != list && list.size() > 0) {
			totalCnt = list.get(0).getTotalCnt();
		}

		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("inVO", inVO);
		return viewPage;
	}

	@RequestMapping("post_reg")
	public String moveReg(PostVO inVO, Model model, HttpSession session) {
		String view = "/post/post_reg";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doMoveToReg                   │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");

		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setUserId(memberDTO.getUserId());
			model.addAttribute("inVO", inVO);

			return view;
		} else {
			return "redirect:/member/login";
		}

	}

	@RequestMapping(value = "/save", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String save(PostVO inVO) throws SQLException {
		String jsonString = "";
		// 제목 미입력 오류코드 10
		if (null != inVO && inVO.getPostTitle().equals("")) {
			return StringUtil.validMessageTOJson("10", "제목을 입력 하세요.");
		}

		// 등록자:20
		if (null != inVO && inVO.getUserId().equals("") && null == inVO.getUserId()) {
			return StringUtil.validMessageTOJson("20", "등록자를 입력 하세요");
		}

		// 내용:30
		if (null != inVO && inVO.getPostContents().equals("")) {
			return StringUtil.validMessageTOJson("30", "내용을 입력 하세요");
		}
		// 서비스 호출
		int flag = this.postService.save(inVO);
		String message = "";
		if (1 == flag) {// 등록 성공
			message = inVO.getPostTitle() + " 등록 성공";
		} else {// 등록실패
			message = inVO.getPostTitle() + " 등록실패";
		}

		jsonString = StringUtil.validMessageTOJson(flag + "", message);

		return jsonString;
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(PostVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌──────────────────────────────┐");
		LOG.debug("│doDelete                      │");
		LOG.debug("│inVO                          │" + inVO);
		LOG.debug("└──────────────────────────────┘");

		int flag = postService.delete(inVO);

		String message = "";
		if (1 == flag) {// 삭제 성공
			message = "게시글이 삭제되었습니다";
		} else {// 등록실패
			message = inVO.getPostSeq() + " 삭제 실패";
		}

		jsonString = StringUtil.validMessageTOJson(flag + "", message);
		LOG.debug("│jsonString                          │" + jsonString);

		return jsonString;
	}

}
