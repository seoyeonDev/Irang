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

import com.example.demo.Irangclass.Irangclass;
import com.example.demo.Irangclass.IrangclassDto;
import com.example.demo.Irangclass.IrangclassService;
import com.example.demo.teacher.TeacherDto;
import com.example.demo.teacher.TeacherService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/child")
public class ChildController {
	@Autowired
	private ChildService service;
	
	@Autowired
	private IrangclassService classservice;
	
	@Autowired
	private TeacherService tservice;
	
	@Value("${spring.servlet.multipart.location}")
	private String path;
	
	//아이회원가입 폼 요청
	@GetMapping("/join")
	public void joinForm(ModelMap map, HttpSession session) {
		ArrayList<IrangclassDto> list = classservice.getAll();
		String loginId = (String) session.getAttribute("loginId");
		ChildDto dto2 = service.getById(loginId);
		map.put("dto2", dto2);
		map.addAttribute("list",list);
	}
	
	//아이부모님이 정보추가기입
	@PostMapping("/join")
	public String join(ChildDto dto, ModelMap map) {
		
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
		ChildDto dto3 = service.save(dto);
		System.out.println(dto3);
		}
		
		return "redirect:/childlog/list?childid="+dto.getChildid();
		//return "redirect:/child/getbyclass?class="+dto2.getClassnum();
	}
	
	//선생님 쪽에서 아이회원가입 폼요청
	@GetMapping("/childadd")
	public void addChildForm(ModelMap map) {
		ArrayList<IrangclassDto> list = classservice.getAll();
		map.addAttribute("list",list);		
	}
	
	//선생님쪽에서 아이회원가입 데이터 입력(ID, PWD, 이름, 반)
	@PostMapping("/childadd")
	public String addChild(ChildDto dto) {
		String cid = dto.getChildid();
		dto.setChildid("c"+cid);
		service.save(dto);
			
		return "redirect:/child/listall";
		//return "redirect:/child/getbyclass?class="+dto2.getClassnum();
	}
	
	//id check
		@ResponseBody
		@RequestMapping("/idcheck")
		public int idCheck(String childid) {
			childid = "c"+childid;
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
	public String login(ChildDto dto, HttpSession session, ModelMap map) {
		String childid = dto.getChildid();
		childid = "c"+childid;
		ChildDto c = service.getById(childid);
		if(c!=null && c.getPwd().equals(dto.getPwd())) {
			session.setAttribute("loginId", c.getChildid());
			return "redirect:/childlog/list?childid="+childid;
		}else {
			map.addAttribute("msg", "정보가 올바르지 않습니다. 다시 로그인해주세요");
			return "/child/login";
		}
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
		ArrayList<IrangclassDto> clist = classservice.getAll();
		map.put("clist",clist);
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/listall.jsp");
		return "index";
	}
	
	//반별로 아이들 리스트
	@GetMapping("/listbyclass")
	public String listbyclass(ModelMap map, int classnum) {
		ArrayList<ChildDto> list = service.getByClass(classnum);
		ArrayList<IrangclassDto> clist = classservice.getAll();
		IrangclassDto cto = classservice.getName(classnum);
		map.put("cto", cto);
		map.put("clist",clist);
		map.put("classnum", classnum);
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/listbyclass.jsp");
		return "index";
	}
	
	//자기반 아이 리스트(아이 로그인시)
	@GetMapping("/listmyclass")
	public String listmyclass(ModelMap map, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ChildDto dto = service.getById(loginId);
		Irangclass ct = dto.getClassnum();
		IrangclassDto cto = classservice.getName(ct.getClassnum());
		Irangclass dto2 = dto.getClassnum();
		ArrayList<ChildDto> list = service.getByClass(dto2.getClassnum());
		map.put("cto", cto);
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/myclass.jsp");
		return "index";
	}
	
	//자기반 아이관리 리스트(선생님 로그인시)
		@GetMapping("/listmyclass2")
		public String listmyclass2(ModelMap map, HttpSession session) {
			String loginId = (String) session.getAttribute("loginId");
			TeacherDto dto = tservice.getTeacher(loginId);
			Irangclass ct = dto.getClassnum();
			IrangclassDto cto = classservice.getName(ct.getClassnum());
			Irangclass dto2 = dto.getClassnum();
			ArrayList<ChildDto> list = service.getByClass(dto2.getClassnum());
			map.put("cto", cto);
			map.put("list", list);
			map.addAttribute("bodyview", "/WEB-INF/views/child/myclass.jsp");
			return "index";
		}
	
	//아이이름으로 검색리스트
	@PostMapping("/listbyname")
	public String listbyname(ModelMap map, String name) {
		ArrayList<ChildDto> list = service.getByName(name);
		ArrayList<IrangclassDto> clist = classservice.getAll();
		map.put("clist",clist);
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
	@PostMapping("/edit")
	public String editInfo(ModelMap map, ChildDto dto) {
		ChildDto dto3 = service.getById(dto.getChildid());
		dto.setImg(dto3.getImg());
		ChildDto dto2 = service.save(dto);
		map.put("dto", dto2);
		map.addAttribute("bodyview", "/WEB-INF/views/child/childinfo.jsp");
		return "index";
	}
	
	//아이사진수정
	@PostMapping("/editimg")
	public String editimg(String childid, MultipartFile f1) {
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
		return "redirect:/child/childinfo?childid=" + childid;
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//아이계정탈퇴
	@GetMapping("/out")
	public String out(ModelMap map, String id) {
		ArrayList<ChildDto> list = service.getAll();
		ArrayList<IrangclassDto> clist = classservice.getAll();
		
		ChildDto dto = service.getById(id);
		if(dto.getImg() != null) {
			File delf = new File(path+dto.getImg());
			delf.delete();
			service.out(id);
		}else {
			service.out(id);
		}
		
		map.put("clist",clist);
		map.put("list", list);
		map.addAttribute("bodyview", "/WEB-INF/views/child/listall.jsp");
		return "index";
	}
}
