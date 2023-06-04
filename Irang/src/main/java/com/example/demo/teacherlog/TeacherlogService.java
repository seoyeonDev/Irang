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
		ArrayList<Teacherlog> list = dao.findByTeacheridOrderByTlnumDesc(teacherid);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// child_id로 검색
	public ArrayList<TeacherlogDto> getByChildId(Child childid) {
		ArrayList<Teacherlog> list = dao.findByChildidOrderByTlnumDesc(childid);
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
		ArrayList<Teacherlog> list = dao.findByTeacheridAndChildidOrderByTlnumDesc(teacherid, childid);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// 글삭제
	public void delete(int tlnum) {
		dao.deleteById(tlnum);
	}

	// 사진 삭제
	public void deleteImg(int tlnum, int imgnum) {
		Teacherlog vo = dao.findById(tlnum).orElse(null);
		//System.out.println("imgnum :" + imgnum);
		if (imgnum == 1) {
			vo.setImg1(null);
		} else if (imgnum == 2) {
			vo.setImg2(null);
		} else if (imgnum == 3) {
			vo.setImg3(null);
		}
		dao.save(vo);
	}

	// 사진 추가
	public void addImg(int tlnum, int imgnum, String imgpath) {
		Teacherlog vo = dao.findById(tlnum).orElse(null);

		if (imgnum == 1) {
			vo.setImg1(imgpath);
		} else if (imgnum == 2) {
			vo.setImg2(imgpath);
		} else if (imgnum == 3) {
			vo.setImg3(imgpath);
		}
		dao.save(vo);
	}

	// 날짜 + teacherid 로 찾기
	public ArrayList<TeacherlogDto> getByDayAndTeacherid(LocalDate tdate, Teacher teacherid) {
		ArrayList<Teacherlog> list = dao.findByTeacheridAndTdateOrderByTlnumDesc(teacherid, tdate);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// 날짜 + childid 로 찾기
	public ArrayList<TeacherlogDto> getByDayAndChildid(LocalDate tdate, Child childid) {
		ArrayList<Teacherlog> list = dao.findByChildidAndTdateOrderByTlnumDesc(childid, tdate);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// month + teacherid 로 찾기
	public ArrayList<TeacherlogDto> getByMonthAndTeacherid(LocalDate start, LocalDate end, Teacher teacherid) {
		ArrayList<Teacherlog> list = dao.findByTeacheridAndTdateBetweenOrderByTlnumDesc(teacherid, start, end);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}

	// month + childid 로 찾기
	public ArrayList<TeacherlogDto> getByMonthAndChildid(LocalDate start, LocalDate end, Child childid) {
		ArrayList<Teacherlog> list = dao.findByChildidAndTdateBetweenOrderByTlnumDesc(childid, start, end);
		ArrayList<TeacherlogDto> dtoList = new ArrayList<TeacherlogDto>();
		for (Teacherlog vo : list) {
			dtoList.add(new TeacherlogDto(vo.getTlnum(), vo.getTeacherid(), vo.getChildid(), vo.getTdate(),
					vo.getActivity(), vo.getHealth(), vo.getImg1(), vo.getImg2(), vo.getImg3(), null));
		}
		return dtoList;
	}
}
