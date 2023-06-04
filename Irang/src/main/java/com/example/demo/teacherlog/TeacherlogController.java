package com.example.demo.teacherlog;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.child.Child;
import com.example.demo.child.ChildDto;
import com.example.demo.child.ChildService;
import com.example.demo.tcomment.TcommentDto;
import com.example.demo.tcomment.TcommentService;
import com.example.demo.teacher.Teacher;
import com.example.demo.teacher.TeacherDto;
import com.example.demo.teacher.TeacherService;

@Controller
@RequestMapping("/teacherlog")
public class TeacherlogController {
	@Autowired
	private TeacherlogService service;

	@Autowired
	private TcommentService cService;

	@Autowired
	private ChildService childService;

	@Autowired
	private TeacherService teacherService;

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
				// String newpath = path + num + "/" + fname;
				File newfile = new File(path + num + "/" + fname);
				// System.out.println(newpath);
				try {
					x.transferTo(newfile);// 파일 업로드
					imgs[i] = fname;
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
		dto.setTlnum(num);
		service.save(dto);// 수정
		// 어디로 가지? 목록?

		return "redirect:/teacherlog/list?teacherid=" + dto.getTeacherid().getTeacherid();
	}

	// 특정쌤이 쓴 일지리스트
	@GetMapping("/list")
	public String tlist(Teacher teacherid, ModelMap map) {
		map.addAttribute("list", service.getByTeacherId(teacherid));
		System.out.println(service.getByTeacherId(teacherid));
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-list.jsp");
		return "index";
	}

	// 특정쌤이 본 디테일 페이지 여기서 수정 가능하죠?
	// 댓글 리스트도 들고가욤~
	@GetMapping("/detail")
	public String tDetail(Teacherlog tlnum, ModelMap map) {
		TeacherlogDto vo = service.getByTlnum(tlnum.getTlnum());
		map.addAttribute("vo", vo);
		// num의 글정보를 가져와서 웹에 뿌리기

		ArrayList<TcommentDto> list = cService.getByTlnum(tlnum);
		map.addAttribute("list", list);
		// 그 글에 대한 모든 댓글을 가져오기

		String className = vo.getTeacherid().getClassnum().getClassname();
		map.addAttribute("className", className);
		System.out.println("className :" + className);
		// 그 반 이름을 가져오기

		String tImg = vo.getTeacherid().getProfile();
		map.addAttribute("tImg", tImg);
		// 선생님 이미지 가져오기

		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-detail.jsp");
		return "index";
	}

	// 특정보호자 아이디로 본 일지 리스트
	@GetMapping("/childList")
	public String tChildList(Child childid, ModelMap map) {
		map.addAttribute("list", service.getByChildId(childid));
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-list.jsp");
		return "index";
	}

	// 특정보호자가 본 디테일 페이지
	@GetMapping("/childDetail")
	public String tChildDetail(int tlnum, ModelMap map) {
		map.addAttribute("vo", service.getByTlnum(tlnum));
		String tImg = service.getByTlnum(tlnum).getTeacherid().getProfile();
		map.addAttribute("tImg", tImg);
		map.addAttribute("bodyview", "/WEB-INF/views/teacherlog/t-detail.jsp");
		return "index";
	}

	// 디테일 : 사진 불러오기
	@GetMapping("/read_img")
	public ResponseEntity<byte[]> read_img(String fname, int tlnum) {
		File f = new File(path + tlnum + '/' + fname);
		System.out.println(path + tlnum + '/' + fname);
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

	// 디테일 : 수정하기
	@PostMapping("/edit")
	@ResponseBody
	public Map edit(TeacherlogDto dto) {
		Map map = new HashMap();
		System.out.println("dto :" + dto);
		TeacherlogDto dto2 = service.getByTlnum(dto.getTlnum());
		dto2.setTlnum(dto.getTlnum());
		dto2.setActivity(dto.getActivity());
		dto2.setHealth(dto.getHealth());
		System.out.println("dto2 :" + dto2);
		service.save(dto2);
		map.put("vo", dto2);
		return map;
	}

	// 디테일 : 삭제하기
	@GetMapping("/del")
	public String del(int tlnum, String teacherid) {
		service.delete(tlnum);

		String delPath = path + tlnum;
		File dir = new File(delPath);
		File[] files = dir.listFiles(); // 디렉토리 안에 있는 파일들을 File 객체로 생성해서 반환
		for (File f : files) { // 상품 이미지를 삭제
			f.delete();
		}
		dir.delete(); // 디렉토리 삭제
		service.delete(tlnum); // db에서 행삭제
		return "redirect:/teacherlog/list?teacherid=" + teacherid;
	}

	// 디테일 : 사진 삭제
	@GetMapping("/imgdel")
	@ResponseBody
	public boolean imgdel(int tlnum, int imgnum, String imgpath) {
		boolean flag = false;
		String delPath = path + tlnum;
		File dir = new File(delPath);
		System.out.println("dir:" + dir);
		File[] files = dir.listFiles();

		int num = 0;
		while (num < files.length) {
			if (files[num].getAbsolutePath().equals(imgpath)) {
				files[num].delete();
				flag = true;
				break;
			}
			num++;
		}

		service.deleteImg(tlnum, imgnum);
		return flag;
	}

	// 디테일 : 사진 추가
	@PostMapping("/imgadd")
	@ResponseBody
	public boolean imgadd(int tlnum, int imgnum, MultipartFile imgfile) {
		boolean flag = true;
		MultipartFile x = imgfile;
		System.out.println("imgpath :" + imgfile);
		System.out.println("imgpath.getOriginalFilename() :" + imgfile.getOriginalFilename());

		String fname = x.getOriginalFilename();
		if (fname != null && !fname.equals("")) {
			File newfile = new File(path + tlnum + "/" + fname);
			try {
				x.transferTo(newfile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 서비스 추가해야해
		service.addImg(tlnum, imgnum, fname);

		return flag;
	}

	// 특정 쌤이 쓴 리스트 : 날짜로 검색
	@GetMapping("/day")
	@ResponseBody
	public Map day(LocalDate tdate, Teacher teacherid) {
		Map map = new HashMap();
		ArrayList<TeacherlogDto> list = service.getByDayAndTeacherid(tdate, teacherid);
		map.put("list", list);
		return map;
	}

	// 보호자 입장 전체 리스트 : 날짜로 검색
	@GetMapping("/childDay")
	@ResponseBody
	public Map childDay(LocalDate tdate, Child childid) {
		Map map = new HashMap();
		ArrayList<TeacherlogDto> list = service.getByDayAndChildid(tdate, childid);
		map.put("list", list);
		return map;
	}

	// 특정 쌤이 쓴 리스트 : 월별로 검색
	@GetMapping("/month")
	@ResponseBody
	public Map month(LocalDate start, LocalDate end, Teacher teacherid) {
		Map map = new HashMap();
		ArrayList<TeacherlogDto> list = service.getByMonthAndTeacherid(start, end, teacherid);
		map.put("list", list);
		return map;
	}

	// 보호자 입장 전체 리스트 : 월별로 검색
	@GetMapping("/childMonth")
	@ResponseBody
	public Map childMonth(LocalDate start, LocalDate end, Child childid) {
		Map map = new HashMap();
		ArrayList<TeacherlogDto> list = service.getByMonthAndChildid(start, end, childid);
		System.out.println("한달 검색");
		System.out.println(list);
		map.put("list", list);
		return map;
	}

	// 특정 쌤이 쓴 리스트 : 아이 이름으로 검색
	@GetMapping("/searchName")
	@ResponseBody
	public Map searchName(String name, String teacherid) {
		Map map = new HashMap();
		ArrayList<TeacherlogDto> list = new ArrayList<TeacherlogDto>();

		ArrayList<ChildDto> clist = childService.getByName(name);
		System.out.println("clist :" + clist);
		for (ChildDto vo : clist) {
			Child child = convertToChild(vo);
			ArrayList<TeacherlogDto> list2 = service.getByChildId(child);
			for (TeacherlogDto dto : list2) {
				System.out.println("dto.getTeacherid() :" + dto.getTeacherid());
				System.out.println("teacherid :" + teacherid);
				if (dto.getTeacherid().getTeacherid().equals(teacherid)) {
					list.add(dto);
				}
			}
		}

		System.out.println("list :" + list);
		map.put("list", list);
		return map;
	}

	// 난 teacherlog에 child라고 써놨고.. 하지만 childservice는 childdto를 반환하기 때문에...
	// ChildDto를 Child로 변경해주기 위해서...
	private Child convertToChild(ChildDto childDto) {
		Child child = new Child();
		child.setChildid(childDto.getChildid());
		return child;
	}

	// 해당 선생님한테 맞는 아이 이름 가져오기
	@GetMapping("/childlist")
	@ResponseBody
	public Map getChildName(String teacherid) {
		Map map = new HashMap();
		TeacherDto dto = teacherService.getTeacher(teacherid);
		int classNum = dto.getClassnum().getClassnum();
		// 선생님 해당 반 정보를 가져오기
		ArrayList<ChildDto> list = childService.getByClass(classNum);
		// 아이 정보를 담아서 보내기 select 버튼에 보여줄꺼에용
		System.out.println("teacherid :" + teacherid);
		System.out.println("dto :" + dto);
		System.out.println("classNum :" + classNum);
		System.out.println("list :" + list);
		map.put("list", list);
		return map;
	}
}
