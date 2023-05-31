package com.example.demo.chcomment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("chlogcom")
public class ChcommentController {
	@Autowired
	private ChcommentService service;
	
	///chlogcom/add?chlognum=1&writer=child&content=죄송합니다+ㅠㅠㅠ
	// 댓글 입력 
	@GetMapping("/add")
	public String add(ChcommentDto dto) {
		service.save(dto);
		return "redirect:/childlog/detail?chlognum=" + dto.getChlognum().getChlognum();
	}
	
	// 댓글 수정 (ajax)
	@ResponseBody
	@GetMapping("/edit")
	public Map edit(int num, String content) {
		ChcommentDto dto = service.get(num);
		dto.setContent(content);
		service.save(dto);
		Map map = new HashMap();
		map.put("content", dto.getContent());
		return map;
	}
	
	// 댓글 삭제 (ajax)
	@ResponseBody
	@GetMapping("/delete")
	public Map delete(int num) {
		ChcommentDto dto = service.get(num);
		service.delete(num);
		ChcommentDto dto2 = null;
		boolean flag = false;
		try {
			dto2 = service.get(num);
		} catch(Exception e) {
			flag = true; // 진짜로 삭제됨~ 
		}
		Map map = new HashMap();
		map.put("flag", flag);
		return map;
	}
	

}
