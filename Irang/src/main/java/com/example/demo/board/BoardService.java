package com.example.demo.board;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.teacher.Teacher;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao dao; 
	
	
	//저장 및 수정 
public int save (BoardDto dto) {
	 Board b = dao.save(new Board(dto.getBoard_num(),dto.getTeacherid(),dto.getTitle(),dto.getWdate(),
			 dto.getContent(),dto.getEdate(),dto.getImg1(),dto.getImg2(),dto.getImg3()));
return b.getBoard_num();
}

//삭제
public void del(int Board_num) {
	dao.deleteById(Board_num);
}

//글 목록 
public ArrayList<BoardDto> getAll(){
	ArrayList<Board> list = (ArrayList<Board>) dao.findAll();
	ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
	for (Board vo : list ) {
		list2.add(new BoardDto (vo.getBoard_num(),vo.getTeacherid(),vo.getTitle(),vo.getWdate(),
				vo.getContent(),vo.getEdate(),vo.getImg1(),vo.getImg2(),vo.getImg3(),null));
	}
	return  list2;
}

//작성자로 검색 
public ArrayList<BoardDto> getByTeacher(String teacherid){
	Teacher teacher = new Teacher(teacherid, "","","",null,""); 
	ArrayList<Board> list = (ArrayList<Board>) dao.findByTeacheridLike(teacher);
	ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
	for (Board vo : list ) {
		list2.add(new BoardDto (vo.getBoard_num(),vo.getTeacherid(),vo.getTitle(),vo.getWdate(),
				vo.getContent(),vo.getEdate(),vo.getImg1(),vo.getImg2(),vo.getImg3(),null));
	}
	return  list2;
}

//제목으로 검색 
public ArrayList<BoardDto> getByTitle(String title){
	ArrayList<Board>list = (ArrayList<Board>) dao.findBytitleLike("%" + title + "%");
	ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
	for (Board vo : list ) {
		list2.add(new BoardDto (vo.getBoard_num(),vo.getTeacherid(),vo.getTitle(),vo.getWdate(),
				vo.getContent(),vo.getEdate(),vo.getImg1(),vo.getImg2(),vo.getImg3(),null));
	}
	return  list2;
}

//내용으로 검색 
public ArrayList<BoardDto> getByContent(String content){
	ArrayList<Board> list = (ArrayList<Board>) dao.findBycontentLike("%" + content + "%");
	ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
	for (Board vo : list ) {
		list2.add(new BoardDto (vo.getBoard_num(),vo.getTeacherid(),vo.getTitle(),vo.getWdate(),
				vo.getContent(),vo.getEdate(),vo.getImg1(),vo.getImg2(),vo.getImg3(),null));
	} 
	return list2 ;
}

//이벤트 날짜로 검색 
public ArrayList<BoardDto> getByEventDate(Date edate){
	ArrayList<Board> list = (ArrayList<Board>) dao.findByEdate(edate);
	ArrayList<BoardDto> list2 = new ArrayList<BoardDto>();
	for (Board vo : list ) {
		list2.add(new BoardDto (vo.getBoard_num(),vo.getTeacherid(),vo.getTitle(),vo.getWdate(),
				vo.getContent(),vo.getEdate(),vo.getImg1(),vo.getImg2(),vo.getImg3(),null));
	} 
	return list2 ;
}

//번호로 검색 
public BoardDto get(int Boardnum) {
	Board vo = dao.findById(Boardnum).orElse(null);
	if (vo==null) {
		return null;
	}
	return  new BoardDto (vo.getBoard_num(),vo.getTeacherid(),vo.getTitle(),vo.getWdate(),
			vo.getContent(),vo.getEdate(),vo.getImg1(),vo.getImg2(),vo.getImg3(),null);
} 


}







	

