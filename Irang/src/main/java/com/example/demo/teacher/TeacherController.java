package com.example.demo.teacher;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	private TeacherService service;
	
	@Value("${spring.servlet.multipart.location}")
	private String path;
	
	//회원가입
	@GetMapping("/join")
	public String joinForm(ModelMap map) {
		map.addAttribute("bodyview","/WEB-INF/views/teacher/join.jsp");
		return "index";
	}
	
	@PostMapping("/join")
	public String join(ModelMap map, TeacherDto dto) {		
		service.save(dto);
		if (dto.getF() != null) {
			MultipartFile f = dto.getF();
			String fname = f.getOriginalFilename();
			File newfile = new File(path + fname);
			try {
				f.transferTo(newfile);// 파일 업로드
				dto.setProfile(fname);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			service.save(dto);
		}
		return "redirect:/teacher/list";
	}
	
	@RequestMapping("/login")
	public String getAll(TeacherDto dto, HttpSession session) {
		TeacherDto dto2 = service.login(dto.getTeacherid());
		if(dto2 != null && dto.getPwd().equals(dto2.getPwd())) {
			session.setAttribute("loginId", dto2.getTeacherid());
			return "redirect:/teacher/list";
		}
		return "index";
	}
	
	//선생님 목록
	@RequestMapping("/list")
	public String getAll(ModelMap map) {
		ArrayList<TeacherDto> list = service.getAll();
		map.addAttribute("list",list);
		
		String bodyview = "/WEB-INF/views/teacher/list.jsp";
		map.addAttribute("bodyview",bodyview);
		return "index";
	}
	
	//회원정보 수정 edit
	@RequestMapping("/mypage")
	public String editForm(String teacherid, ModelMap map) {
		TeacherDto dto = service.getTeacher(teacherid);
		map.addAttribute("dto",dto);
		map.addAttribute("bodyview","/WEB-INF/views/teacher/mypage.jsp");
		return "index";
	}
	
	
	@RequestMapping("/edit")
	public String edit(ModelMap map, TeacherDto dto) {
		TeacherDto dto2 = service.getTeacher(dto.getTeacherid());
		dto2.setName(dto.getName());
		dto2.setPhone(dto.getPhone());
		dto2.setPwd(dto.getPwd());
		String teacherid = service.save(dto2);
		dto = service.getTeacher(teacherid);
		map.addAttribute("dto",dto);
		map.addAttribute("bodyview","/WEB-INF/views/teacher/mypage.jsp");
		return "index";
		
	}
	
	//프로필 사진 변경
	@RequestMapping("/editprofile")
	public String editprofile(String teacherid, MultipartFile f1) {
		TeacherDto dto = service.getTeacher(teacherid);
		String fname = f1.getOriginalFilename();
		String newpath = path + teacherid + "/" + fname;
		
		File newfile = new File(newpath);
		try {
			f1.transferTo(newfile);
			String delf = dto.getProfile();
			dto.setProfile(newpath);
			if(delf != null) {
				File delFile = new File(delf);
				delFile.delete();
			}
			service.save(dto);
		}catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return "redirect:/teacher/mypage?teacherid=" + teacherid;
	}
	
	@RequestMapping("/delprofile")
	public String delprofile(String teacherid) {
		TeacherDto dto = service.getTeacher(teacherid);
		String delf= dto.getProfile();
		dto.setProfile(null);
		if(delf != null) {
			File delFile = new File(delf);
			delFile.delete();
		}
		service.save(dto);
		return "redirect:/teacher/mypage?teacherid="+teacherid;
	}
	
	
	
	//탈퇴 out
	@RequestMapping("/del")
	public String del(String teacherid) {
		String delPath = path + teacherid;
		File dir = new File(delPath);
		File[] file = dir.listFiles();
		for(File f:file) {
			f.delete();
		}
		dir.delete();
		service.delShop(teacherid);
		return "redirect:/teacher/list";
	}
	
	//선생님 아이디 검색 findbyid
	@RequestMapping("/getbyid")
	public String getbyid(String teacherid, ModelMap map) {
		TeacherDto list = service.getTeacher(teacherid);
		map.addAttribute("list",list);
		map.addAttribute("bodyview","/WEB-INF/views/teacher/list.jsp");
		return "index";
	}
	
	//선생님 이름으로 검색
	@RequestMapping("/getbyname")
	public String getbyname(String name, ModelMap map) {
		map.addAttribute("bodyview", "/WEB-INF/views/teacher/list.jsp");
		return "index";
	}
	

}
