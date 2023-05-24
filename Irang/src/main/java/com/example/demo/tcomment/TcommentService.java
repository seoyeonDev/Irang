package com.example.demo.tcomment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TcommentService {
	@Autowired
	private TcommentDao dao;
	
	// 댓글 추가, 수정
//	public int save(TcommentDto dto) {
//		Tcomment entity = dao.save(new Tcomment(dto.getCommentNum(), dto.getTl_num(), dto.getComWriter(), dto.getContent(), dto.getComDate()));
//		return entity.getCommentNum();
//	}
	
	// 한 글에 대한 모든 댓글 
//	public ArrayList<TcommentDto> getByTlNum(int tl_num){
//		ArrayList<Tcomment> list = dao.findByTl_num(tl_num);
//		ArrayList<TcommentDto> dtoList = new ArrayList<TcommentDto>();
//		for(Tcomment vo:list) {
//			dtoList.add(new TcommentDto(vo.getCommentNum(), vo.getTl_num(), vo.getComWriter(), vo.getContent(), vo.getComDate()));
//		}
//		return dtoList;
//	}
	
	// 삭제
	public void delete(int commentNum) {
		dao.deleteById(commentNum);
	}
	
}
