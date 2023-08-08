package com.heno.airock.controller;

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
import com.heno.airock.service.MailSendService;
import com.heno.airock.service.MemberService;

@Controller
@RequestMapping("/member") // 공통 주소 처리
public class MemberController implements PcwkLoger {
	
	@Autowired
	MailSendService mailService;

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
		int saveResult = memberService.find(memberDTO);
		System.out.println("saveResult" + saveResult);
		if (saveResult > 0) {
			return "/member/login";
		} else {
			return "/member/save";
		}
	}
	

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		String jsonString = "";
		boolean loginResult = memberService.login(memberDTO);
		MessageDTO message = new MessageDTO();
		if (loginResult) {
			session.setAttribute("user", memberDTO);
			message.setMsgId("1");
			message.setMsgContents(memberDTO.getUserId() + "님 환영합니다!");
			LOG.debug("└session┘"+ session.getAttribute("user"));
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
	public String postRegister(MemberDTO memberDTO) throws Exception {
		int result = memberService.idChk(memberDTO);
		try {
			if (result == 1) {
				return "/register";
			} else if (result == 0) {
				memberService.save(memberDTO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@GetMapping("/**/idChk")
	@ResponseBody
	public int idChk(MemberDTO memberDTO) throws Exception {
		int result = memberService.idChk(memberDTO);
		return result;
	}
	
}
