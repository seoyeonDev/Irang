package com.example.demo.child;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Irangclass.Irangclass;

@Service
public class ChildService {
	@Autowired
	private ChildDao dao;
	
	//아이추가, 아이수정
	public ChildDto save(ChildDto dto) {
		Child vo = dao.save(new Child(dto.getChildid(),dto.getPwd(),dto.getName(),dto.getPname(),dto.getBirthday(),dto.getPhone(),dto.getAllergy(),dto.getClassnum(),dto.getImg()));
		return new ChildDto(vo.getChildid(),vo.getPwd(),vo.getName(),vo.getPname(),vo.getBirthday(),vo.getPhone(),vo.getAllergy(),vo.getClassnum(),vo.getImg(),null);
	}
	
	//아이전체리스트
	public ArrayList<ChildDto> getAll(){
		ArrayList<Child> list = (ArrayList<Child>) dao.findAll();
		ArrayList<ChildDto> dtoList = new ArrayList<>();
		for(Child vo:list) {
			dtoList.add(new ChildDto(vo.getChildid(),vo.getPwd(),vo.getName(),vo.getPname(),vo.getBirthday(),vo.getPhone(),vo.getAllergy(),vo.getClassnum(),vo.getImg(),null));
		}
		return dtoList;
	}
	//이름으로 검색
	public ArrayList<ChildDto> getByName(String name){
		ArrayList<Child> list = (ArrayList<Child>) dao.findByNameLike("%"+name+"%");
		ArrayList<ChildDto> dtoList = new ArrayList<>();
		for(Child vo:list) {
			dtoList.add(new ChildDto(vo.getChildid(),vo.getPwd(),vo.getName(),vo.getPname(),vo.getBirthday(),vo.getPhone(),vo.getAllergy(),vo.getClassnum(),vo.getImg(),null));
		}
		return dtoList;
	}
	//반으로 검색
	public ArrayList<ChildDto> getByClass(int classnum){
		Irangclass vo2 = new Irangclass(classnum,"");
		ArrayList<Child> list = (ArrayList<Child>) dao.findByClassnum(vo2);
		ArrayList<ChildDto> dtoList = new ArrayList<>();
		for(Child vo:list) {
			dtoList.add(new ChildDto(vo.getChildid(),vo.getPwd(),vo.getName(),vo.getPname(),vo.getBirthday(),vo.getPhone(),vo.getAllergy(),vo.getClassnum(),vo.getImg(),null));
		}
		return dtoList;
	}
	
	//아이계정의 id로 검색
	public ChildDto getById(String id) {
		Child vo = dao.findById(id).orElse(null);
		if(vo==null) {
			return null;
		}
		return new ChildDto(vo.getChildid(),vo.getPwd(),vo.getName(),vo.getPname(),vo.getBirthday(),vo.getPhone(),vo.getAllergy(),vo.getClassnum(),vo.getImg(),null);
	}
	
	//아이계정 탈퇴
	public void out(String id) {
		dao.deleteById(id);
	}
}
