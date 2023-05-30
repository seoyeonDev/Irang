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

import com.example.demo.Irangclass.IrangclassDto;
import com.example.demo.Irangclass.IrangclassService;
import com.example.demo.teacher.TeacherDto;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/child")
public class ChildController {
	@Autowired
	private ChildService service;
	
	@Autowired
	private IrangclassService classservice;
	
	@Value("${spring.servlet.multipart.location}")
	private String path;
	
	//아이회원가입 폼 요청
	@GetMapping("/join")
	public void joinForm(ModelMap map) {
		ArrayList<IrangclassDto> list = classservice.getAll();
		map.addAttribute("list",list);
	}
	
	//아이회원가입
	@PostMapping("/join")
	public String join(ChildDto dto) {
		service.save(dto);
		if(dto.getF() != null) {
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
		System.out.println(dto2);
		}
		
		return "redirect:/child/listall";
		//return "redirect:/child/getbyclass?class="+dto2.getClassnum();
	}
	
	//id check
		@ResponseBody
		@RequestMapping("/idcheck")
		public int idCheck(String childid) {
			ChildDto dto = service.getById(childid);
			int cnt = 0;
			if (dto != null) {
				cnt = 1;
			}
			return cnt;
		}
	
	//로그인폼 요청
	@GetMapping("/login")
	public void loginForm() {
	}
	
	//로그인
	@PostMapping("/login")
	public String login(ChildDto dto, HttpSession session) {
		ChildDto c = service.getById(dto.getChildid());
		if(c!=null && c.getPwd().equals(dto.getPwd())) {
			session.setAttribute("loginId", c.getChildid());
		}
		return "index";
	}
	
	@GetMapping("/read_img")
	public ResponseEntity<byte[]> read_img(String fname){
		File f = new File(path+fname);//C:/img/shop/ + 1.jpg
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
	
	//반별로 아이들 리스트
	@GetMapping("listbyclass")
	public String listbyclass(ModelMap map, int classnum) {
		ArrayList<ChildDto> list = service.getByClass(classnum);
		map.put("classnum", classnum);
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/listbyclass.jsp");
		return "index";
	}
	
	//아이이름으로 검색리스트
	@PostMapping("listbyname")
	public String listbyname(ModelMap map, String name) {
		ArrayList<ChildDto> list = service.getByName(name);
		map.put("name", name);
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/listbyname.jsp");
		return "index";
	}
	
	//아이정보페이지(childinfo)
	@GetMapping("/childinfo")
	public String childinfo(ModelMap map, String childid) {
		ChildDto dto = service.getById(childid);
		map.put("dto", dto);
		map.addAttribute("bodyview", "/WEB-INF/views/child/childinfo.jsp");
		return "index";
	}
	
	//아이정보수정(사진제외한 정보수정)
	@PostMapping("edit")
	public String editInfo(ModelMap map, ChildDto dto, HttpSession session) {
		String loginId = (String) session.getAttribute("loginIdChild");
		ChildDto dto3 = service.getById(loginId);
		dto.setImg(dto3.getImg());
		ChildDto dto2 = service.save(dto);
		map.put("dto", dto2);
		map.addAttribute("bodyview", "/WEB-INF/views/child/childinfo.jsp");
		return "redirect:/";
	}
	
	//아이사진수정
	@PostMapping("/editimg")
	public String editimg(String childid, MultipartFile f1, HttpSession session) {
		String loginId = (String) session.getAttribute("loginIdChild");
		ChildDto dto = service.getById(childid);
		String fname = f1.getOriginalFilename();
		if (fname != null && !fname.equals("")) {
			File newfile = new File(path+fname);// 복사할 새 파일 생성. c:/img/child/원본파일명
			System.out.println(path+fname);
			try {
				f1.transferTo(newfile);// 파일 업로드
				String delf = "";
				delf = dto.getImg();
				dto.setImg(fname);
				if (delf != null) {
					File delFile = new File(delf);
					delFile.delete();
				}
				service.save(dto);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/child/childinfo?childid=" + loginId;
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//아이계정탈퇴
	@GetMapping("/out")
	public String out(HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		ChildDto dto = service.getById(id);
		File delf = new File(path+dto.getImg());
		delf.delete();
		service.out(id);
		session.invalidate();
		return "redirect:/";
	}
}
