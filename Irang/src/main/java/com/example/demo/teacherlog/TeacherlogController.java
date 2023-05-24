package com.example.demo.teacherlog;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.teacher.Teacher;

@Controller
@RequestMapping("/teacherlog")
public class TeacherlogController {
	@Autowired
	private TeacherlogService service;

	@Value("${spring.servlet.multipart.location}")
	private String path;

	@GetMapping("/add")
	public String addForm(ModelMap map) {
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/add.jsp");
		return "index";
	}

	@PostMapping("/add")
	public String add(ModelMap map, TeacherlogDto dto) {
		int num = service.save(dto);
		File dir = new File(path + num);
		dir.mkdir();
		MultipartFile[] f = dto.getF();
		String[] imgs = new String[3];
		for (int i = 0; i < f.length; i++) {
			MultipartFile x = f[i];
			String fname = x.getOriginalFilename();// 원본파일명
			if (fname != null && !fname.equals("")) {
				String newpath = path + num + "/" + fname;
				File newfile = new File(newpath);
				System.out.println(newpath);
				try {
					x.transferTo(newfile);// 파일 업로드
					imgs[i] = newpath;
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		dto.setImg1(imgs[0]);
		dto.setImg2(imgs[1]);
		dto.setImg3(imgs[2]);
		dto.setTl_num(num);
		service.save(dto);// 수정
		// 어디로 가지? 목록?
	
		return "redirect:/teacherlog/list?teacher_id" + dto.getTeacher_id().getTeacherid();
	}

	// 특정쌤이 쓴 일지
	@GetMapping("/tList")
	public String tlist(String teacher_id, ModelMap map) {
		map.addAttribute("list", service.getByTeacherId(teacher_id));
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-list.jsp");
		return "index";
	}

	// 특정쌤이 본 디테일 페이지 여기서 수정 가능하죠?
	@GetMapping("/tDetail")
	public String tDetail(int tl_num, ModelMap map) {
		map.addAttribute("vo", service.getByTlNum(tl_num));
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-detail.jsp");
		return "index";
	}

	// 특정보호자 아이디로 본 일지 리스트
	@GetMapping("/tChildList")
	public String tChildList(String child_id, ModelMap map) {
		map.addAttribute("list", service.getByChildId(child_id));
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-list.jsp");
		return "index";
	}

	// 특정보호자가 본 디테일 페이지
	@GetMapping("/tChildDetail")
	public String tChildDetail(int tl_num, ModelMap map) {
		map.addAttribute("vo", service.getByTlNum(tl_num));
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-detail.jsp");
		return "index";
	}

	// 디테일 : 사진 불러오기
	@GetMapping("/read_img")
	public ResponseEntity<byte[]> read_img(String fname) {
		File f = new File(fname);
		HttpHeaders header = new HttpHeaders(); // HttpHeaders 객체 생성
		ResponseEntity<byte[]> result = null; // 선언
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));// 응답 데이터의 종류를 설정
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
