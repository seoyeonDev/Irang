package com.example.demo.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao dao; 
	
public int save (BoardDto dto) {
	 Board b = dao.save(new Board(dto.getBoard_num(),dto.getTeacherid(),dto.getTitle(),dto.getW_date(),
			 dto.getContent(),dto.getEvent_date(),dto.getImg1(),dto.getImg2(),dto.getImg3()));
return b.getBoard_num();
}
	
}
