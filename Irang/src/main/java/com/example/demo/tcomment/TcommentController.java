package com.example.demo.tcomment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.child.ChildService;
import com.example.demo.teacher.TeacherService;
import com.example.demo.teacherlog.TeacherlogService;

@Controller
@RequestMapping("/comment")
public class TcommentController {
	@Autowired
	private TcommentService service;

	@Autowired
	private TeacherService tService;

	@Autowired
	private ChildService cService;

	@Autowired
	private TeacherlogService tlService;

	// @GetMapping("")

	// 댓글 작성 ajax
	@ResponseBody
	@PostMapping("/add")
	public Map add(TcommentDto dto) {
		System.out.println("dtd: " + dto);
		Map map = new HashMap();
		// service.
		int num = service.save(dto);
		TcommentDto dto2 = service.getByNum(num);
		map.put("dto", dto2);

		String tcName = "";
		if (dto.getComwriter().startsWith("t")) {
			tcName = tService.getTeacher(dto.getComwriter()).getClassnum().getClassname();
		} else if (dto.getComwriter().startsWith("c")) {
			tcName = cService.getById(dto.getComwriter()).getName();
		}
		map.put("tcName", tcName);

		return map;
	}

	@ResponseBody
	@GetMapping("/del")
	public Map del(int commentnum) {
		Map map = new HashMap();
		service.delete(commentnum);

		boolean flag = true;

		map.put("flag", flag);
		return map;
	}

	@ResponseBody
	@PostMapping("/edit")
	public Map edit(TcommentDto dto) {
		Map map = new HashMap();
		TcommentDto dto2 = service.getByNum(dto.getCommentnum());
		dto2.setContent(dto.getContent());
		service.save(dto2);
		System.out.println("dto :" + dto);
		System.out.println("dto2 :" + dto2);
		map.put("dto", dto2);

		return map;
	}
}
