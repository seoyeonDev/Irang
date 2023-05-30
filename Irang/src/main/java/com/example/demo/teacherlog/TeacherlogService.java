package com.example.demo.teacherlog;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.child.Child;
import com.example.demo.teacher.Teacher;

@Service
public class TeacherlogService {
	@Autowired
	private TeacherlogDao dao;

	// 일지 추가, 수정
	public int save(TeacherlogDto dto) {
		Teacherlog entity = dao.save(new Teacherlog(dto.getTlnum(), dto.getTeacherid(), dto.getChildid(),
				dto.getTdate(), dto.getActivity(), dto.getHealth(), dto.getImg1(), dto.getImg2(), dto.getImg3()));
		return entity.getTlnum();
	}

	// 전체
	public ArrayList<TeacherlogDto> getAll() {
		ArrayList<Teacherlog> list = (ArrayList<Teacherlog>) dao.findAll();
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// teacher_id로 검색
	public ArrayList<TeacherlogDto> getByTeacherId(Teacher teacherid) {
		ArrayList<Teacherlog> list = dao.findByTeacherid(teacherid);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// child_id로 검색
	public ArrayList<TeacherlogDto> getByChildId(Child childid) {
		ArrayList<Teacherlog> list = dao.findByChildid(childid);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// Tlnum으로 검색
	public TeacherlogDto getByTlnum(int tlnum) {
		Teacherlog vo = dao.findById(tlnum).orElse(null);
		return new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(), vo.getActivity(),
				vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null);
	}

	// 선생님이 쓴 글 중 아이 선택해서 글보기
	public ArrayList<TeacherlogDto> getByCandT(Teacher teacherid, Child childid) {
		ArrayList<Teacherlog> list = dao.findByTeacheridAndChildid(teacherid, childid);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// 삭제
	public void delete(int tlnum) {
		dao.deleteById(tlnum);
	}

	// 날짜로 찾기
	public ArrayList<TeacherlogDto> getByDay(LocalDate tdate) {
		ArrayList<Teacherlog> list = dao.findByTdate(tdate);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// 날짜 + teacherid 로 찾기
	public ArrayList<TeacherlogDto> getByDayAndTeacherid(LocalDate tdate, Teacher teacherid) {
		ArrayList<Teacherlog> list = dao.findByTeacheridAndTdate(teacherid, tdate);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}
	
	// 날짜 + childid 로 찾기
	public ArrayList<TeacherlogDto> getByDayAndChildid(LocalDate tdate, Child childid) {
		ArrayList<Teacherlog> list = dao.findByChildidAndTdate(childid, tdate);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}
}
