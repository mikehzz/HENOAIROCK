package com.heno.airock.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.dto.MemberDTO;
import com.heno.airock.dto.MessageDTO;
import com.heno.airock.dto.MyPlayListVO;
import com.heno.airock.service.MailSendService;
import com.heno.airock.service.MemberService;
import com.heno.airock.service.MyPlayListService;

@Controller
@RequestMapping("/member") // 공통 주소 처리
public class MemberController implements PcwkLoger {

	@Autowired
	MailSendService mailService;
	
	@Autowired
	MyPlayListService myPlayListService;

	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}

	// 이용약관 동의 페이지
	@GetMapping("/agree")
	public String agreeForm() {
		return "/member/agree";
	}

	// 회원 가입 페이지 이동
	@GetMapping("/register")
	public String saveForm() {
		return "/member/register";
	}

	// 비밀번호변경 페이지 이동
	@GetMapping("/passwd")
	public String findForm() {
		return "/member/passwd";
	}

	@GetMapping("/delete")
	public String delete() {
		return "/member/delete";
	}

	// 회원가입 이메일 인증
	@GetMapping("/**/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		return mailService.joinEmail(email);
	}

	// 비밀번호찾기 이메일 인증
	@GetMapping("/**/findCheck")
	@ResponseBody
	public String findCheck(String email) {
		return mailService.findEmail(email);
	}

	// 비밀번호변경 페이지 에서 로그인 페이지로 이동
	@PostMapping("/find")
	public String find(@ModelAttribute MemberDTO memberDTO) {
		LOG.debug("└memberDTO┘" + memberDTO);
		int saveResult = memberService.find(memberDTO);
		System.out.println("saveResult" + saveResult);
		if (saveResult > 0) {
			return "/member/login";
		} else {
			return "/member/passwd";
		}
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(@ModelAttribute MemberDTO memberDTO, HttpServletRequest request) {
		String jsonString = "";
		HttpSession session = request.getSession();
		
		boolean loginResult = memberService.login(memberDTO);
		LOG.debug("└loginResult┘" + loginResult);
		MessageDTO message = new MessageDTO();
		if (loginResult) {
			session.setAttribute("user", memberDTO);
			message.setMsgId("1");
			message.setMsgContents(memberDTO.getUserId() + "님 환영합니다!");
			LOG.debug("└session┘" + session.getAttribute("user"));
			jsonString = new Gson().toJson(message);
			return jsonString;
		} else {
			message.setMsgId("2");
			message.setMsgContents("아이디 또는 비밀번호를 확인해주세요.");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	}

	// 회원가입 post
	@PostMapping("/**/register")
	public String postRegister(MemberDTO memberDTO) throws SQLException {
		
		int idChkResult = memberService.idChk(memberDTO);
		
		MyPlayListVO inVO = new MyPlayListVO();
		MessageDTO message = new MessageDTO();
		
		if (idChkResult == 1) {
			message.setMsgId("1");
			message.setMsgContents("중복확인을 다시 진행해주세요.");
			return "/register";
		} else if(idChkResult == 0) {
			int myResult = memberService.save(memberDTO);
			if(myResult == 1) {
				inVO.setUserId(memberDTO.getUserId());
				myPlayListService.save(inVO);
				return "redirect:/";
			}
			
			return "/register";
		} else {
			return "/register";
		}
		
		
	}

	// 아이디 중복 체크
	@GetMapping("/**/idChk")
	@ResponseBody
	public int idChk(MemberDTO memberDTO) throws Exception {
		LOG.debug("└idChk┘" + memberDTO);
		int result = memberService.idChk(memberDTO);
		return result;
	}

}
