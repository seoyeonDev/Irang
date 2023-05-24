package com.example.demo.teacher;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Irangclass.Irangclass;

import jakarta.servlet.http.HttpSession;

@Service
public class TeacherService {

	@Autowired
	private TeacherDao dao;
	
	//회원추가 /수정
	public String save(TeacherDto dto) {
		Teacher t = dao.save(new Teacher(dto.getTeacherid(),dto.getName(),dto.getPwd(),dto.getPhone(),dto.getClassnum(),dto.getProfile()));
		return t.getTeacherid();
	}

	//로그인
	public TeacherDto login(String id) {
		Teacher dto = dao.findById(id).orElse(null);
		if(dto == null) {
			return null;
		}
		return new TeacherDto(dto.getTeacherid(),dto.getName(),dto.getPwd(),dto.getPhone(),dto.getClassnum(),dto.getProfile(), null);
	}
	
	//탈퇴 out
	public void delShop(String teacherid) {
		dao.deleteById(teacherid);
	}
	
	//선생님 아이디 검색 findbyid
	public TeacherDto getTeacher(String teacherid) {
		Teacher t = dao.findById(teacherid).orElse(null);
		if(t==null) {
			return null;
		}
		return new TeacherDto(t.getTeacherid(),t.getName(),t.getPwd(),t.getPhone(),t.getClassnum(),t.getProfile(), null);
	}
	
	
	//선생님 이름으로 검색
	public ArrayList<TeacherDto> getByTName(String name){
		ArrayList<Teacher> list = dao.findByNameLike(name);
		ArrayList<TeacherDto> list2 = new ArrayList<TeacherDto>();
		for (Teacher t : list) {
			list2.add(new TeacherDto(t.getTeacherid(),t.getName(),t.getPwd(),t.getPhone(),t.getClassnum(),t.getProfile(), null));
		}
		return list2;
	}

	//학급별 선생님 검색
	public ArrayList<TeacherDto> getByClass(int classnum){
		Irangclass ic = new Irangclass(classnum,""); 
		ArrayList<Teacher> list = (ArrayList<Teacher>) dao.findByClassnum(ic);
		ArrayList<TeacherDto> list2 = new ArrayList<TeacherDto>();
		for (Teacher t : list) {
			list2.add(new TeacherDto(t.getTeacherid(),t.getName(),t.getPwd(),t.getPhone(),t.getClassnum(),t.getProfile(), null));
		}
		return list2;
	}
	
	//학급이 null인 선생님 검색 
	
	
	//선생님 목록
	public ArrayList<TeacherDto> getAll(){
		ArrayList<Teacher> list = (ArrayList<Teacher>) dao.findAll();
		ArrayList<TeacherDto> list2 = new ArrayList<TeacherDto>();
		for (Teacher t : list) {
			list2.add(new TeacherDto(t.getTeacherid(),t.getName(),t.getPwd(),t.getPhone(),t.getClassnum(),t.getProfile(), null));
		}
		return list2;
	}
	
	//1년마다 class 비우기 
	
	
}
