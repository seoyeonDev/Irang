package com.example.demo.child;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/child")
public class ChildController {
	@Autowired
	private ChildService service;
	
	@Value("${spring.servlet.multipart.location}")
	private String path;
	
	//아이회원가입 폼 요청
	@GetMapping("/join")
	public String joinForm(ModelMap map) {
		map.addAttribute("bodyview", "/WEB-INF/views/child/join.jsp");
		return "index";
	}
	
	//아이회원가입
	@PostMapping("/join")
	public String join(ChildDto dto) {
		MultipartFile f = dto.getF();
		String fname = f.getOriginalFilename();
		File newfile = new File(path+fname);
		try {
			f.transferTo(newfile);
			dto.setImg(fname);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ChildDto dto2 = service.save(dto);
		return "redirect:/child/listall";
		//return "redirect:/child/getbyclass?class="+dto2.getClassnum();
	}
	
	//id중복체크
	@ResponseBody
	@PostMapping("/idcheck")
	public Map idcheck(String id) {
		ChildDto dto = service.getById(id);
		boolean flag = false;
		if (dto == null) {
			flag = true;
		}
		Map map = new HashMap();
		map.put("flag", flag);
		return map;
	}
	
	//로그인폼 요청
	@GetMapping("/login")
	public String loginForm(ModelMap map) {
		map.addAttribute("bodyview", "/WEB-INF/views/child/login.jsp");
		return "index";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(ChildDto dto, HttpSession session) {
		ChildDto c = service.getById(dto.getChildid());
		if(c!=null && c.getPwd().equals(dto.getPwd())) {
			session.setAttribute("loginIdChild", c.getChildid());
		}
		return "index";
	}
	
	@GetMapping("/read_img")
	public ResponseEntity<byte[]> read_img(String fname){
		File f = new File(path+fname);//c:data/ + 가평1.jpg
		HttpHeaders header = new HttpHeaders(); //HttpHeaders 객체 생성
		ResponseEntity<byte[]> result = null; //응답 객체 선언
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));//응답 데이터의 종류를 지정
			//응답 객체 생성
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),
					header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	//아이전체 리스트
	@GetMapping("/listall")
	public String list(ModelMap map) {
		ArrayList<ChildDto> list = service.getAll();
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/listall.jsp");
		return "index";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	//아이계정탈퇴
	@GetMapping("/out")
	public String out(HttpSession session) {
		String id = (String) session.getAttribute("loginIdChild");
		ChildDto dto = service.getById(id);
		File delf = new File(path+dto.getImg());
		delf.delete();
		service.out(id);
		session.invalidate();
		return "redirect:/";
	}
}
