package com.example.demo.board;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Date;

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
	
	//이벤트 날짜로 검색 목록 
		@RequestMapping("/findByedate")
		public String getbyedate(Date edate, ModelMap map) {
			map.addAttribute("list", service.getByEventDate(edate));
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
//	@PostMapping("/add")
//	public String add(ModelMap map, BoardDto dto, HttpSession session ) {
//		String loginId = (String) session.getAttribute("loginId"); 
//		int num = service.save(dto); //dto를 저장 시키고 반환 받은 글 번호를 이용한다. 
//		File dir = new File(path+num); //파일 폴더 생성
//		dir.mkdir(); // 디렉토리 생성~ 
//		MultipartFile[] f = dto.getImgf(); 
//		// 이름이 f 인 멀티파트파일배열 생성해서 그 안에 dto에 만들어 둔 Imgf getter 호출
//		//dto.getImgf(); 에 있는 service.save(dto)에 저장 된 
//		String [] imgs = new String[3]; //이미지 경로를 담을 방 3칸짜리 String 배열 생성 
//		for (int i = 0; i<f.length; i++) {
//			MultipartFile x = f[i]; 
//			String fname = x.getOriginalFilename();
//			if (fname !=null && fname.equals("")) {
//				String newpath = path+num+"/"+fname;
//				File newfile = new File(newpath);
//				
//				try {
//					x.transferTo(newfile);
//					imgs[i] = newpath;
//				}catch (IllegalStateException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//		}
//			dto.setImg1(imgs[0]);
//			dto.setImg2(imgs[1]);
//			dto.setImg3(imgs[2]);
//			dto.setBoard_num(num);
//			service.save(dto);
//			
//			return "redirect:/board/list";
//	}
	
	//글등록 
	private void saveFiles(BoardDto dto, int num) {
	    MultipartFile[] files = dto.getImgf();
	    String[] imgs = new String[3];
	    
	    for (int i = 0; i < files.length; i++) {
	        MultipartFile file = files[i];
	        String filename = file.getOriginalFilename();
	        
	        if (filename != null && !filename.isEmpty()) {
	            String newPath = path + num + "/" + filename;
	            File newFile = new File(newPath);
	            
	            try {
	                file.transferTo(newFile);
	                imgs[i] = newPath;
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    
	    dto.setImg1(imgs[0]);
	    dto.setImg2(imgs[1]);
	    dto.setImg3(imgs[2]);
	}

	@PostMapping("/add")
	public String add(ModelMap map, BoardDto dto, HttpSession session) {
	    String loginId = (String) session.getAttribute("loginId");
	    int num = service.save(dto);
	    File dir = new File(path + num);
	    dir.mkdir();
	    
	    saveFiles(dto, num);
	    dto.setBoard_num(num);
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
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f),
					header, HttpStatus.OK); 
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
public String detailForm(int Board_num, ModelMap map) {
	map.addAttribute("dto",service.get(Board_num));
	map.addAttribute("bodyview", "/WEB-INF/views/board/detail.jsp");
	 return "index";
}

//수정 폼 보여주기 
@RequestMapping("/editform")
public String editForm(int Board_num, ModelMap map) {
	map.addAttribute("dto",service.get(Board_num));
	map.addAttribute("bodyview", "/WEB-INF/views/board/edit.jsp");
	 return "index";
}

//수정 폼에서 수정 
@PostMapping("/edit")
public String editBoard(ModelMap map, BoardDto dto, MultipartFile f1, MultipartFile f2, MultipartFile f3) {
BoardDto Odto = service.get(dto.getBoard_num()); 

Odto.setTitle(dto.getTitle());
Odto.setContent(dto.getContent());
Odto.setEdate(dto.getEdate());

handleImageUpload(Odto, f1, 1);
handleImageUpload(Odto, f2, 2);
handleImageUpload(Odto, f3, 3);

return "redirect:/board/list";
}

private void handleImageUpload(BoardDto dto,MultipartFile file, int imgnum ) {
if(file !=null && !file.isEmpty()) {
	String fileName = file.getOriginalFilename();
	String filePath = path + dto.getBoard_num() +  "/" + fileName;
	File newFile = new File(filePath);
    try {
        file.transferTo(newFile);
        String existingImagePath = getImagePath(dto, imgnum);
        if (existingImagePath != null) {
            File existingFile = new File(existingImagePath);
            existingFile.delete();
        }
        setImagePath(dto, imgnum, filePath);
    } catch (IOException e) {
        e.printStackTrace();
    }
}
}

private String getImagePath(BoardDto dto, int imgnum) {
    switch (imgnum) {
        case 1:
            return dto.getImg1();
        case 2:
            return dto.getImg2();
        case 3:
            return dto.getImg3();
        default:
            return null;
    }
}

private void setImagePath(BoardDto dto, int imgnum, String path) {
    switch (imgnum) {
        case 1:
            dto.setImg1(path);
            break;
        case 2:
            dto.setImg2(path);
            break;
        case 3:
            dto.setImg3(path);
            break;
    }
}

@RequestMapping("/del")
public String delboard (int Board_num) {
	service.del(Board_num);
	 return "redirect:/board/list";
}
	
}






