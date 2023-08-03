package com.heno.airock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heno.airock.cmn.PcwkLoger;
import com.heno.airock.service.MusicService;

@Controller
@RequestMapping("/music")
public class MusicController implements PcwkLoger{

	@Autowired
	MusicService musicService;

	public MusicController() {}

	@GetMapping("/main")
	public String main() {
		return "main";
	}

	@GetMapping("/gpt")
	public String gpt() {
		return "gpt";
	}
}