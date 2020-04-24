package com.ds.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ds.service.StoreService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/map/*")
public class MapController {
	@Autowired
	private StoreService service;
	
	@GetMapping("/usermap")
	public void usermap(Model model) {
		model.addAttribute("list",service.read());
		log.info("usermap");
	}
	
	@GetMapping("/test")
	public void test() {
		log.info("test");
	}
}
