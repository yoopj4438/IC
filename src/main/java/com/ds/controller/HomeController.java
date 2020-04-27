package com.ds.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ds.domain.StoreVO;
import com.ds.service.StoreService;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	@Autowired
	private StoreService service;
	
	@GetMapping(value = "/")
	public String home(Locale locale, Model model) {
		
		
		model.addAttribute("list",service.read());
		log.info("usermap");
		
		return "home";
	}
	@GetMapping(value = "/getList",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public ResponseEntity<List<StoreVO>> getList(@Param("latitude") String latitude,
			@Param("longitude") String longitude,@Param("length") String length){
		StoreVO store = new StoreVO();
		store.setLatitude(latitude);
		store.setLongitude(longitude);
		store.setLength(length);
		log.info("1111111111111111111111111111111111"+latitude);
		return new ResponseEntity(service.getList(store),HttpStatus.OK);
	}
	
	
}
