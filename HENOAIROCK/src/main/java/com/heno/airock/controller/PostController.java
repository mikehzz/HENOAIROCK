package com.heno.airock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heno.airock.dto.PostDTO;
import com.heno.airock.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	private final PostService postService;
	
	public PostController(PostService postService) {
		this.postService = postService;
	}
	
	
	@GetMapping("/post")
	public String select(@ModelAttribute PostDTO postDTO, Model model) {
		List<PostDTO> postList = postService.select(postDTO);
		model.addAttribute("postList", postList);
		return "post";
	}


}

