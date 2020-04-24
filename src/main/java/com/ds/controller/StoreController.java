package com.ds.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ds.domain.StoreVO;
import com.ds.service.StoreService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/Store/*")
@Log4j
public class StoreController {
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/Regist")
	public void StoreRegist(Model model) {
		List<Map<String, String>> cateList = storeService.cateList();
	model.addAttribute("cateList", cateList);
	}
	@PostMapping("/RegistSubmit")
	public String RegistSubmit(StoreVO svo,RedirectAttributes rttr) throws Exception {
		int result = storeService.Regist(svo);
		rttr.addFlashAttribute("result",result);
		return "redirect:/Store/Regist";
	}
}
