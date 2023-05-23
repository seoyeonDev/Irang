package com.example.demo.teacherlog;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TeacherlogService {
	@Autowired
	private TeacherlogDao dao;

	// 일지 추가, 수정
	public int save(TeacherlogDto dto) {
		Teacherlog entity = dao.save(new Teacherlog (dto.getTl_num(), dto.getTeacher_id(), dto.getChild_id(), dto.getTdate(),
				dto.getActivity(), dto.getHealth(), dto.getImg1(), dto.getImg2(), dto.getImg3()));
		return entity.getTl_num();
	}

	// 전체
	public ArrayList<TeacherlogDto> getAll() {
		ArrayList<Teacherlog> list = (ArrayList<Teacherlog>)dao.findAll();
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTl_num(), vo.getTeacher_id(), vo.getChild_id(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// teacher_id로 검색
	public ArrayList<TeacherlogDto> getByTeacherId(String teacher_id) {
		ArrayList<Teacherlog> list = dao.findByTeacher_id(teacher_id);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTl_num(), vo.getTeacher_id(), vo.getChild_id(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// child_id로 검색
	public ArrayList<TeacherlogDto> getByChildId(String child_id) {
		ArrayList<Teacherlog> list = dao.findByTeacher_id(child_id);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTl_num(), vo.getTeacher_id(), vo.getChild_id(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}
	
	// tl_num으로 검색
	public TeacherlogDto getByTlNum(int tl_num) {
		Teacherlog vo = dao.findById(tl_num).orElse(null);
		return new TeacherlogDto(vo.getTl_num(), vo.getTeacher_id(), vo.getChild_id(), vo.getTdate(),
				vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null);
	}

	// 선생님이 쓴 글 중 아이 선택해서 글보기
	public ArrayList<TeacherlogDto> getByCandT(String teacher_id, String child_id) {
		ArrayList<Teacherlog> list = dao.findByTeacher_idAndChild_id(teacher_id, child_id);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTl_num(), vo.getTeacher_id(), vo.getChild_id(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}
	
	// 삭제
	public void delete(int tl_num) {
		dao.deleteById(tl_num);
	}
}
