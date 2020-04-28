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
	public String login(@Param("snum") String snum, @Param("password") String password, Model model) {

		StoreVO store = service.login(snum);
		log.info("login" + snum + "" + password);
		log.info(store);
		if (store == null) {
			model.addAttribute("id", "false");
			return "redirect:/";
		} else if (store.getPassword().equals(password)) {
			model.addAttribute("result", "로그인성공");
			model.addAttribute("store", store);
			return "redirect:/prod/list";
		} else {
			model.addAttribute("result", "패스워드를 확인해주세요.");
			return "redirect:/";
		}

	}
}
