package com.example.demo.teacher;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.Irangclass.IrangclassDto;
import com.example.demo.Irangclass.IrangclassService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

	@Autowired
	private TeacherService service;
	
	@Autowired
	private IrangclassService classservice;
	
	@Value("${spring.servlet.multipart.location}")
	private String path;
	
	
	
	//회원가입
	@GetMapping("/join")
	public void joinForm(ModelMap map) {
		ArrayList<IrangclassDto> list = classservice.getAll();
		map.addAttribute("list",list);
	}
	
	@PostMapping("/join")
	public String join(ModelMap map, TeacherDto dto) {	
		String teacherid = dto.getTeacherid();
		teacherid = "t"+teacherid;
		dto.setTeacherid(teacherid);
		
		
		
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
	

	//id check
	@ResponseBody
	@RequestMapping("/idcheck")
	public int idCheck(String teacherid) {
		teacherid = "t"+teacherid;
		TeacherDto dto = service.getTeacher(teacherid);
		int cnt = 0;
		if (dto != null) {
			cnt = 1;
		}
		return cnt;
	}
	
	
	@GetMapping("/login")
	public void loginForm() {
	
	}
	
	@PostMapping("/login")
	public String getAll(TeacherDto dto, HttpSession session, ModelMap map) {
		String teacherid = dto.getTeacherid();
		teacherid = "t"+teacherid;
		TeacherDto dto2 = service.login(teacherid);
		if(dto2 != null && dto.getPwd().equals(dto2.getPwd())) {
			session.setAttribute("loginId", dto2.getTeacherid());
			return "redirect:/child/listmyclass2";
		}else { //로그인 실패
			map.addAttribute("msg","정보가 올바르지 않습니다. 다시 로그인해주세요.");
			return "/teacher/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/teacher/list";
	}
	
	//선생님 목록
	@RequestMapping("/list")
	public String getAll(ModelMap map) {
		ArrayList<TeacherDto> list = service.getAll();
		map.addAttribute("list",list);

		ArrayList<IrangclassDto> classlist = classservice.getAll();
		map.addAttribute("classlist",classlist);
		
		String bodyview = "/WEB-INF/views/teacher/tlist.jsp";
		map.addAttribute("bodyview",bodyview);
		return "index";
	}
	
	//회원정보 수정 edit
	@RequestMapping("/mypage")
	public String editForm(String teacherid, ModelMap map) {
		ArrayList<IrangclassDto> list = classservice.getAll();
		map.addAttribute("list",list);
		
		TeacherDto dto = service.getTeacher(teacherid);
		map.addAttribute("dto",dto);
		map.addAttribute("bodyview","/WEB-INF/views/teacher/mypage.jsp");
		return "index";
	}
	
	
	@RequestMapping("/edit")
	public String edit(ModelMap map, TeacherDto dto) {
		TeacherDto dto2 = service.getTeacher(dto.getTeacherid());
		dto2.setClassnum(dto.getClassnum());
		dto2.setName(dto.getName());
		dto2.setPhone(dto.getPhone());
		dto2.setPwd(dto.getPwd());
		String teacherid = service.save(dto2);
		dto = service.getTeacher(teacherid);
		map.addAttribute("dto",dto);
		return "redirect:/teacher/list";
		
	}
	
	@RequestMapping("/editlist")
	public String editList(ModelMap map, TeacherDto dto) {
		TeacherDto dto2 = service.getTeacher(dto.getTeacherid());
		dto2.setClassnum(dto.getClassnum());
		dto2.setName(dto.getName());
		dto2.setPhone(dto.getPhone());
		dto2.setPwd(dto.getPwd());
		String teacherid = service.save(dto2);
		dto = service.getTeacher(teacherid);
		map.addAttribute("dto",dto);
		return "redirect:/teacher/list";
		
	}
	//이미지 출력
	@RequestMapping("/read_img")
	public ResponseEntity<byte[]> read_img(String fname) {
		File f = new File(path+fname); 
		HttpHeaders header = new HttpHeaders(); //HttpHeaders 객체 생성
		ResponseEntity<byte[]> result = null; //응답 객체 생성
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath())); 
			//파일에 대한 마임타입?을 지정/응답 데이터의 종류(파일의 형태)를 지정
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),
					header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	//프로필 사진 변경
	@RequestMapping("/editprofile")
	public String editprofile(String teacherid, MultipartFile f) {
		TeacherDto dto = service.getTeacher(teacherid);
		String fname = f.getOriginalFilename();
		String newpath = ""; 
		if(fname != null && !fname.equals("")) {
			newpath = path + fname;
		File newfile = new File(newpath);
		try {
			f.transferTo(newfile);
			String delf = dto.getProfile();
			dto.setProfile(fname);
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
	@RequestMapping("/delete")
	public String del(String teacherid) {
		if (service.getTeacher(teacherid)!=null) {
		String delPath = path + teacherid;
		File dir = new File(delPath);
		File[] file = dir.listFiles();
		for(File f:file) {
			f.delete();
		}
		dir.delete();
		}
		service.delShop(teacherid);
		return "redirect:/teacher/list";
	}
	
	//선생님 아이디 검색 findbyid
	@RequestMapping("/getbyid")
	public String getbyid(String teacherid, ModelMap map) {
		TeacherDto list = service.getTeacher(teacherid);
		map.addAttribute("list",list);
		map.addAttribute("bodyview","/WEB-INF/views/teacher/tlist.jsp");
		return "index";
	}
	
	//선생님 이름으로 검색
	@RequestMapping("/getbyname")
	public String getbyname(String name, ModelMap map) {
		ArrayList<TeacherDto> list = service.getByTName(name);
		map.addAttribute("list",list);
		
		ArrayList<IrangclassDto> classlist = classservice.getAll();
		map.addAttribute("classlist",classlist);
		
		map.addAttribute("bodyview", "/WEB-INF/views/teacher/tlist.jsp");
		return "index";
	}
	

	//클래스로 검색
	@RequestMapping("/getbyclass")
	public String getbyclass(int classnum, ModelMap map) {
//		int num = Integer.parseInt(classnum);
		ArrayList<TeacherDto> list = service.getByClass(classnum);
		map.addAttribute("list",list);
		map.addAttribute("bodyview", "/WEB-INF/views/teacher/tlist.jsp");
		return "index";
	}
	
	

}
