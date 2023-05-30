package com.example.demo.tcomment;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.teacherlog.Teacherlog;

@Service
public class TcommentService {
	@Autowired
	private TcommentDao dao;
	
	// 댓글 추가, 수정
	public int save(TcommentDto dto) {
		Tcomment entity = dao.save(new Tcomment(dto.getCommentnum(), dto.getTlnum(), dto.getComwriter(), dto.getContent(), dto.getComdate()));
		return entity.getCommentnum();
	}
	
	// commentnum으로 댓글 찾기
	public TcommentDto getByNum(int commentnum) {
		Tcomment c = dao.findById(commentnum).orElse(null);
		return new TcommentDto(c.getCommentnum(), c.getTlnum(), c.getComwriter(), c.getContent(),c.getComdate());
	}
	
	// 한 글에 대한 모든 댓글 
	public ArrayList<TcommentDto> getByTlnum(Teacherlog tlnum){
		ArrayList<Tcomment> list = dao.findByTlnum(tlnum);
		ArrayList<TcommentDto> dtoList = new ArrayList<TcommentDto>();
		for(Tcomment vo:list) {
			dtoList.add(new TcommentDto(vo.getCommentnum(), vo.getTlnum(), vo.getComwriter(), vo.getContent(), vo.getComdate()));
		}
		return dtoList;
	}
	
	// 삭제
	public void delete(int commentnum) {
		dao.deleteById(commentnum);
	}
	
	// 날짜별로 검색
	public ArrayList<TcommentDto> getByComdate(LocalDate comdate){
		ArrayList<Tcomment> list = dao.findByComdate(comdate);
		ArrayList<TcommentDto> dtoList = new ArrayList<TcommentDto>();
		for(Tcomment vo:list) {
			dtoList.add(new TcommentDto(vo.getCommentnum(), vo.getTlnum(), vo.getComwriter(), vo.getContent(), vo.getComdate()));
		}
		return dtoList;
	}
	
}
