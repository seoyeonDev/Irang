 package com.example.demo.childlog;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.child.Child;

@Service
public class ChildlogService {
	@Autowired
	private ChildlogDao dao;
	
	// 글작성, 수정 
	public int save(ChildlogDto dto) {
		Childlog entity = dao.save(new Childlog(dto.getChlognum(), dto.getChildid(), dto.getWdate(), dto.getContent(), dto.getImg(), dto.getTcheck()));
		return entity.getChlognum();
		
	} 
	
	// 글삭제
	public void delChlog(int num) {
		dao.deleteById(num);
	}
	
	// 글번호로 검색
	public ChildlogDto getChlog(int num) {
		Childlog entity = dao.findById(num).orElse(null);
		if(entity == null) {
			return null;
		}
		return new ChildlogDto(entity.getChlognum(), entity.getChildid(), entity.getWdate(), entity.getContent(), entity.getImg(), entity.getTcheck(), null);
	}
	
	// childid 로 검색 
	public ArrayList<ChildlogDto> getByChildid(String childid) {
		Child vo = new Child(childid, "", "", "", null, "", "", null, "");
		ArrayList<Childlog> list = (ArrayList<Childlog>) dao.findByChildidOrderByChlognumDesc(vo);
		ArrayList<ChildlogDto> dtolist = new ArrayList<ChildlogDto>();
		for (Childlog entity:list) {
			dtolist.add(new ChildlogDto(entity.getChlognum(), entity.getChildid(), entity.getWdate(), entity.getContent(), entity.getImg(), entity.getTcheck(), null));
		}
		return dtolist;
	}
	
	// childid 와 날짜로 검색 (기간)
	public ArrayList<ChildlogDto> getByIdAndDate(Child childid, LocalDate start, LocalDate end) {
		ArrayList<Childlog> list = dao.findByChildidAndWdateBetweenOrderByChlognumDesc(childid, start, end);
		ArrayList<ChildlogDto> dtolist = new ArrayList<ChildlogDto>();
		for (Childlog entity:list) {
			dtolist.add(new ChildlogDto(entity.getChlognum(), entity.getChildid(), entity.getWdate(), entity.getContent(), entity.getImg(), entity.getTcheck(), null));
		}
		return dtolist;
	}
	
	// 월별 검색 
	// 연도랑 월 다 가져와서 검색해야 함~~
//	public ArrayList<ChildlogDto> getMonth(Child childid, int month) {
//		ArrayList<Childlog> list = dao.findByChildidAndWdateLikeOrderByChlognumDesc(childid, "___" + month + "___"); //수정하기 
//		ArrayList<ChildlogDto> dtolist = new ArrayList<ChildlogDto>();
//		for (Childlog entity:list) {
//			dtolist.add(new ChildlogDto(entity.getChlognum(), entity.getChildid(), entity.getWdate(), entity.getContent(), entity.getImg(), entity.getTcheck(), null));
//		}
//		return dtolist;
//	}
	
	
	// 미확인 (tcheck=0) 
	public ArrayList<ChildlogDto> getByTcheck(Child childid, int tcheck) {
		ArrayList<Childlog> list = (ArrayList<Childlog>) dao.findByChildidAndTcheckOrderByChlognumDesc(childid, tcheck);
		ArrayList<ChildlogDto> dtolist = new ArrayList<ChildlogDto>();
		for (Childlog entity:list) {
			dtolist.add(new ChildlogDto(entity.getChlognum(), entity.getChildid(), entity.getWdate(), entity.getContent(), entity.getImg(), entity.getTcheck(), null));
		}
		return dtolist;
	}
	

}
