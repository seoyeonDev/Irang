package com.example.demo.Irangclass;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IrangclassService {

	@Autowired
	private IrangclassDao dao;
	
	//클래스 추가 & 수정
	public IrangclassDto save(IrangclassDto dto) {
		Irangclass entity = dao.save(new Irangclass(dto.getClassnum(),dto.getClassname()));
		return new IrangclassDto(entity.getClassnum(),entity.getClassname());
	}
	
	//클래스 삭제
	public void delClass(int num) {
		dao.deleteById(num);
	}
	
	//클래스 전체목록
	public ArrayList<IrangclassDto> getAll() {
		ArrayList<Irangclass> list = (ArrayList<Irangclass>)dao.findAll();
		ArrayList<IrangclassDto> list2 = new ArrayList<IrangclassDto>();
		for(Irangclass c : list) {
			list2.add(new IrangclassDto(c.getClassnum(),c.getClassname()));
		}
		return list2;
	}
	
	//클래스 검색 (이름 출력)
	public IrangclassDto getName(int classnum) {
		Irangclass c = dao.findById(classnum).orElse(null);
		if(c==null) {
			return null;
		}
		return new IrangclassDto(c.getClassnum(),c.getClassname());
	}
	
	//이름으로 검색
	public IrangclassDto getbyName(String classname) {
		Irangclass c = dao.findByClassname(classname);
		if(c==null) {
			return null;
		}
		return new IrangclassDto(c.getClassnum(),c.getClassname());
	}
}
