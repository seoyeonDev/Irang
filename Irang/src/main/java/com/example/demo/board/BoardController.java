package com.example.demo.board;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Value("${spring.servlet.multipart.location}")
	private String path;
	
	//글 목록 
	@RequestMapping("/list")
	public String list (ModelMap map) {
		map.addAttribute("list", service.getAll());
		map.addAttribute("bodyview", "/WEB-INF/views/board/list.jsp");
		return "index";
	}
	
	//내용으로 검색 목록 
	@RequestMapping("/findByContent")
	public String getbycontent(String content, ModelMap map) {
		map.addAttribute("list", service.getByContent(content));
		map.addAttribute("bodyview", "/WEB-INF/views/board/list.jsp");
		return "index";
	}
	
	//제목으로 검색 목록 
		@RequestMapping("/findByTitle")
		public String getbytitle(String title, ModelMap map) {
			map.addAttribute("list", service.getByTitle(title));
			map.addAttribute("bodyview", "/WEB-INF/views/board/list.jsp");
			return "index";
		}
		
		// 작성자으로 검색 목록
		@RequestMapping("/findByTeacher")
		public String getbyteacher(String teacherid, ModelMap map) {
			map.addAttribute("list", service.getByTeacher(teacherid));
			map.addAttribute("bodyview", "/WEB-INF/views/board/list.jsp");
			return "index";
		}

	//이벤트 날짜로 검색 목록 
		@RequestMapping("/findByedate")
		public String getbyedate(String edate, ModelMap map) throws ParseException {
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			 LocalDate date;
			 String msg = "";
			 date = LocalDate.parse(edate, formatter);
			  map.addAttribute("list", service.getByEventDate(date));
			map.addAttribute("bodyview", "/WEB-INF/views/board/list.jsp");
			return "index";
		}
				
	
	//글 등록 폼 
	@GetMapping("/add")
	public String addForm(ModelMap map) {
		map.addAttribute("bodyview","/WEB-INF/views/board/add.jsp" );
		return "index";
	}
	
	//글 등록 완료시 
	@PostMapping("/add")
	public String add(ModelMap map, BoardDto dto, HttpSession session ) {
		
		String loginId = (String) session.getAttribute("loginId"); 
		
		int num = service.save(dto); //dto를 저장 시키고 반환 받은 글 번호를 이용한다. 
		File dir = new File(path+num); //파일 폴더 생성
		dir.mkdir(); // 디렉토리 생성~ 
		MultipartFile[] f = dto.getImgf(); 
		// 이름이 f 인 멀티파트파일배열 생성해서 그 안에 dto에 만들어 둔 Imgf getter 호출
		//dto.getImgf(); 에 있는 service.save(dto)에 저장 된 
		String [] imgs = new String[3]; //이미지 경로를 담을 방 3칸짜리 String 배열 생성 
		for (int i = 0; i<f.length; i++) {
			MultipartFile x = f[i]; 
			String fname = x.getOriginalFilename();
			if (fname !=null && !fname.equals("")) {
				String newpath = path + num + "/" + fname;
				File newfile = new File(newpath);				
				try {
					x.transferTo(newfile);
					imgs[i] = newpath;
				}catch (IllegalStateException e) {
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
			dto.setBnum(num);
			service.save(dto);
			
			return "redirect:/board/list";
	}
		
	
//이미지 읽어드리기 
@GetMapping("/read_img")
public  ResponseEntity<byte[]> read_img(String fname){
	File f = new File(fname);
	ResponseEntity<byte[]> result = null; //선언
	if(fname != null && fname.length() != 0) {			
		HttpHeaders header = new HttpHeaders(); //HttpHeaders 객체 생성
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));//응답 데이터의 종류를 설정
			//응답 객체 생성해서 넣는다. 
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),header, HttpStatus.OK); 
			//현재 상태까지 담은는 중
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return result;
} 

//디테일 폼 보여주기 
@GetMapping("/detail")
public String detailForm(int bnum, ModelMap map) {
	map.addAttribute("dto",service.get(bnum));
	map.addAttribute("bodyview", "/WEB-INF/views/board/detail.jsp");
	 return "index";
}

//수정 폼 보여주기 
@RequestMapping("/editform")
public String editForm(int bnum, ModelMap map) {
	
	map.addAttribute("dto",service.get(bnum));
	map.addAttribute("bodyview", "/WEB-INF/views/board/edit.jsp");
	 return "index";
}

//이미지 수정 
@PostMapping("/editimg")
public String editimg(ModelMap map, int bnum, MultipartFile f1, int imgnum) {
	
	BoardDto dto = service.get(bnum);
	
	String fname = f1.getOriginalFilename();
	String newpath = "";
	
	if(fname != null && !fname.equals("")) {
		newpath = path + bnum + "/" + fname;
		File newfile = new File(newpath);
		try {
			f1.transferTo(newfile);// 파일 업로드
			String delf = "";// 삭제할 파일 경로
			switch (imgnum) {
			case 1:
				delf = dto.getImg1();
				dto.setImg1(newpath);
				break;
			case 2:
				delf = dto.getImg2();
				dto.setImg2(newpath);
				break;
			case 3:
				delf = dto.getImg3();
				dto.setImg3(newpath);
				break;
			}
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
	return "redirect:/board/editform?bnum=" + bnum;
}

//내용 수정 
@PostMapping("/edit")
public String edit (ModelMap map, BoardDto dto) {
	
	BoardDto dto1 = service.get(dto.getBnum());
	
	
	dto1.setTitle(dto.getTitle());
	dto1.setContent(dto.getContent());
	dto1.setMgnum(dto.getMgnum());
	dto1.setEdate(dto.getEdate());
	int num = service.save(dto1);
	dto = service.get(num);
	map.addAttribute("dto", dto);
	map.addAttribute("bodyview","/WEB-INF/views/board/detail.jsp");
	return "index";
} 

//글 삭제 -> 이미지 같이 자동 삭제
@RequestMapping("/del")
public String delboard (int bnum) {
	service.del(bnum); //글 삭제 
	String delPath = path + bnum; //용량 차지하니까 파일까지 삭제해주는게 좋겟지? 
	File dir = new File(delPath); //그래서 해당 경로의 파일을 찾아내서 
	File [] files = dir.listFiles();
	for (File f : files) {
		f.delete();
	}  //파일들을 모두 삭제하고 
	dir.delete();	  //만들어 준 file 도 삭제해버려~~ 
	 return "redirect:/board/list";
}

// 이미지만 삭제 
@RequestMapping("/delimg")
public String delimg(int bnum, int imgnum) {
	BoardDto dto = service.get(bnum);
	String delf = "";
	switch (imgnum) {
	case 1:
		delf = dto.getImg1();
		dto.setImg1(null);
		break;
	case 2:
		delf = dto.getImg2();
		dto.setImg2(null);
		break;
	case 3:
		delf = dto.getImg3();
		dto.setImg3(null);
		break;
	}
	 if (delf != null) {
	        File delFile = new File(delf);
	        if (delFile.exists()) {
	            delFile.delete();
	        }
	    }

	service.save(dto);
	return "redirect:/board/editform?bnum="+bnum;
}

@RequestMapping("/addimg")
public String add(ModelMap map, HttpSession session, int bnum, BoardDto dto ) {
	
	String loginId = (String) session.getAttribute("loginId"); 
	service.save(dto);
	//dto = service.get(bnum);  //dto를 저장 시키고 반환 받은 글 번호를 이용한다. 
	int num = dto.getBnum();
	
	File dir = new File(path+num); //파일 폴더 생성
	dir.mkdir(); // 디렉토리 생성~ 
	MultipartFile[] f = dto.getImgf(); 
	// 이름이 f 인 멀티파트파일배열 생성해서 그 안에 dto에 만들어 둔 Imgf getter 호출
	//dto.getImgf(); 에 있는 service.save(dto)에 저장 된 
	String [] imgs = new String[3]; //이미지 경로를 담을 방 3칸짜리 String 배열 생성 
	
	for (int i = 0; i<f.length; i++) {
		MultipartFile x = f[i]; 
		String fname = x.getOriginalFilename();
		if (fname !=null && !fname.equals("")) {
			String newpath = path + num + "/" + fname;
			File newfile = new File(newpath);				
			try {
				x.transferTo(newfile);
				imgs[i] = newpath;
			}catch (IllegalStateException e) {
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
		dto.setBnum(num);
		service.save(dto);
		
		return "redirect:/board/editform?bnum=" + bnum;
}
	

}






