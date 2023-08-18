package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.ChatMessageDetailVO;
import com.heno.airock.dto.ChatMessageVO;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.service.ChatService;

@Controller
@RequestMapping("/main")
public class MainController implements PcwkLoger{
	
	@Autowired
	ChatService chatService;
	
	@RequestMapping(value = "")
	public String main(ChatMessageVO inVO, Model model, HttpSession session) throws SQLException {
		String viewPage = "/common/main";
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		if (memberDTO != null) {
			inVO.setUserId(memberDTO.getUserId());
			List<ChatMessageVO> list = chatService.select(inVO);
			LOG.debug("list:" + list);
			model.addAttribute("MsgList", list);
			
			return viewPage;
		} else {
			return "redirect:/member/login";
		}
		
	}
	
	@RequestMapping(value= "/start", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String start(ChatMessageVO inVO, HttpSession session) throws SQLException {
		String jsonString = "";
		MessageDTO message = new MessageDTO();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("user");
		
		if (memberDTO != null) {
			LOG.debug("│userVO                          │" + memberDTO);
			inVO.setUserId(memberDTO.getUserId());
			inVO.setChatDiv("10");
			
			int flag = this.chatService.save(inVO);
			if (1 == flag) {
				message.setMsgId("1");
				message.setMsgContents("채팅이 시작됩니다!");
			} else {
				message.setMsgId("2");
				message.setMsgContents("문제 발생 재접속 바랍니다!");
			}
			jsonString = new Gson().toJson(message);
			
			return jsonString;
		} else {
			message.setMsgId("3");
			message.setMsgContents("로그인 후  이용 가능합니다!");
			
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	
		
	}
	
	

}
