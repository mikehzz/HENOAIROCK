package com.heno.airock.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heno.airock.dto.PostVO;
import com.heno.airock.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	PostService postService;
	
	public PostController() {
	}
	
	
	@GetMapping("")
	public String select(@ModelAttribute PostVO inVO, Model model) throws SQLException {
		List<PostVO> postList = postService.select(inVO);
		model.addAttribute("postList", postList);
		return "post";
	}


}

