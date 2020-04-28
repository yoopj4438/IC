package com.ds.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	@PostMapping(value = "/excelUp.do")
	@ResponseBody
    public void ExcelUp(HttpServletRequest req, HttpServletResponse rep){
        log.info("@@@@@@@@@@@@@@@ExcelUp START@@@@@@@@@@@@@@@");
 
        Map returnObject = new HashMap(); 
        
        try { // MultipartHttpServletRequest 생성 
            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
            Iterator iter = mhsr.getFileNames(); 
            MultipartFile mfile = null; 
            String fieldName = ""; 
            
            // 값이 나올때까지
            while (iter.hasNext()) { 
                fieldName = iter.next().toString(); // 내용을 가져와서 
                mfile = mhsr.getFile(fieldName); 
                String origName; 
                origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //한글꺠짐 방지 // 파일명이 없다면 
                
                returnObject.put("params", mhsr.getParameterMap()); 
                
                
                //위치 및 파일
                service.getExcelUpload("D:\\"+origName);
            }
            
            } catch (UnsupportedEncodingException e) { // TODO Auto-generated catch block 
                e.printStackTrace(); 
            }catch (IllegalStateException e) { // TODO Auto-generated catch block 
                e.printStackTrace(); 
            } catch (IOException e) { // TODO Auto-generated catch block 
                e.printStackTrace(); 
            }
 
        
        log.info("ExcelUp END");
        
    }
}
