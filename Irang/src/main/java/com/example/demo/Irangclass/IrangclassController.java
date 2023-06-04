package com.example.demo.Irangclass;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/irangclass")
public class IrangclassController {
	
	@Autowired
	private IrangclassService service;
	
	//class 목록 - list로 전송
	@RequestMapping("/list")
	public String getAllClass(ModelMap map) {
		ArrayList<IrangclassDto> list = service.getAll();
		map.addAttribute("list",list);
		
		String bodyview = "/WEB-INF/views/irangclass/list.jsp";
		map.addAttribute("bodyview", bodyview);
		return "index";
	}
	
	// class 추가
	@GetMapping("/add")
	public String addForm(ModelMap map) {
		map.addAttribute("bodyview","/WEB-INF/views/irangclass/add.jsp");
		return "index";
	}
	
	@PostMapping("/add")
	public String add(ModelMap map, IrangclassDto dto) {
		IrangclassDto dto2 = service.save(dto);
		return "redirect:/irangclass/list";
	}
	
	// class 삭제
	@RequestMapping("/delete")
	public String del(int num) {
		service.delClass(num);
		return "redirect:/irangclass/list";
	}
	
//	@RequestMapping("/getByName")
//	public String getByName(ModelMap map, int classnum) {
//		IrangclassDto dto = service.getName(classnum);
//		String classname = dto.getClassname();
//		map.addAttribute("classname",classname);
//		
//		
//	}

}
