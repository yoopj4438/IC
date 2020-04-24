package com.ds.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ds.domain.ProdVO;
import com.ds.service.ProdService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/prod/*")
@AllArgsConstructor
public class ProdController {
	private ProdService service;

	@GetMapping("/register")
	public void register() {
	}

	@PostMapping("/register")
	public String registerSubmit(ProdVO prod) {
		service.register(prod);
		return "redirect:/prod/list";
	}

	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/modify")
	public String modify(ProdVO prod) {
		service.modify(prod);
		return "redirect:/prod/list";
	}
	
	@PostMapping("/delete")
	public String delete(ProdVO prod) {
		log.info("delete");
		service.delete(prod);
		return "redirect:/prod/list";
	}
}
