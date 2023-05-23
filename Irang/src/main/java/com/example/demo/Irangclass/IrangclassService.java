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
		Irangclass entity = dao.save(new Irangclass(dto.getClass_num(),dto.getClass_name()));
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
	
}
