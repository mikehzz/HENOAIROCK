package com.heno.airock.controller;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.service.MyPlayListService;


@Controller
@RequestMapping("/mypage")
public class MyPageController implements PcwkLoger {
	
	@Autowired
	MyPlayListService myPlayListService;
	
	@RequestMapping(value="")
	public String select(MyPlayListVO inVO, Model model, HttpServletRequest reqeust, HttpSession session) throws SQLException {
		String viewPage = "/member/mypage";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setUserId(memberDTO.getUserId());
			MyPlayListVO outVO = myPlayListService.selectLikeSeq(inVO);
			LOG.debug("│outVO                          │" + outVO);
			inVO.setMyListSeq(outVO.getMyListSeq());
			LOG.debug("│inVO                          │" + inVO);
			if (inVO != null) {
				List<MyPlayListVO> list = myPlayListService.select(inVO);
				LOG.debug("list:" + list);
				model.addAttribute("list", list);
			}
 			
			return viewPage;
		} else {
			return "redirect:/member/login";
		}
		
		
		
	}
	
	
	
	
	
}
