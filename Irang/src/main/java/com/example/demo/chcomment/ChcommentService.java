package com.example.demo.chcomment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.childlog.Childlog;

@Service
public class ChcommentService {
	@Autowired
	private ChcommentDao dao;
	
	// 추가, 수정 
	public void save(ChcommentDto dto) {
		dao.save(new Chcomment(dto.getNum(), dto.getChlognum(), dto.getWriter(), dto.getContent(), dto.getWdate()));
	}
	
	// 삭제 
	public void delete(int num) {
		dao.deleteById(num);
	}
	
	// 글번호로 검색 --> 수정&삭제할 때 호출용 
	public ChcommentDto get(int num) {
		Chcomment entity = dao.findById(num).orElse(null);
		if(entity == null) {
			return null;
		}
		return new ChcommentDto(entity.getNum(), entity.getChlognum(), entity.getWriter(), entity.getContent(), entity.getWdate());
	}
	
	// 일지 글번호로 검색 --> 일지 디테일에 한번에 띄울 거 
	public ArrayList<ChcommentDto> getAll(int chlognum) {
		Childlog vo = new Childlog(chlognum, null, null, "", "", 0);
		ArrayList<Chcomment> list = (ArrayList<Chcomment>) dao.findByChlognum(vo);
		ArrayList<ChcommentDto> dtolist = new ArrayList<ChcommentDto>();
		for (Chcomment entity:list) {
			dtolist.add(new ChcommentDto(entity.getNum(), entity.getChlognum(), entity.getWriter(), entity.getContent(), entity.getWdate()));
		}
		return dtolist;
	}

}
