package com.ds.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.ds.domain.StoreVO;
import com.ds.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	@Autowired
	private UserService service;
	
	@PostMapping("/login")
	public String login(@Param("sid") String sid,@Param("password") String password,Model model) {
	
		
		StoreVO store = service.login(sid);
		log.info("login"+sid+""+password);
		log.info(store);
		if(store == null) {
			model.addAttribute("result", "아이디와 패스워드를 확인해주세요.");
			return "redirect:/";
		}else if(store.getPassword().equals(password)){
			model.addAttribute("store", store);
			return "redirect:/prod/list";
		}else {
			model.addAttribute("result", "패스워드를 확인해주세요.");
			return "redirect:/";
		}
		
		
	}
}
