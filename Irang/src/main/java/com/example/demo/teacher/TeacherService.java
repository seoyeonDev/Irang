package com.example.demo.teacher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherService {

	@Autowired
	private TeacherDao dao;
	
	//회원추가 join
	public void save(TeacherDto dto) {
		dao.save(new Teacher(dto.getTeacherid(),dto.getName(),dto.getPwd(),dto.getPhone(),dto.getClassnum(),dto.getProfile()));
	}
	
	//마이페이지 mypage
	//회원정보 수정 edit
	//프로필 사진 변경
	//탈퇴 out
	
	//선생님 아이디 검색 findbyid
	//선생님 이름으로 검색

	//선생님 목록
	//학급별 선생님 목록
	
	//1년마다 class 비우기 
}
