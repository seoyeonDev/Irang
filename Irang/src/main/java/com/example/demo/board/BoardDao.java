package com.example.demo.board;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.teacher.Teacher;

@Repository
public interface BoardDao extends JpaRepository <Board, Integer>{
	
	// 이벤트 날짜로 검색
	ArrayList<Board> findByEdate(Date edate);
	
	//작성자로 검색 
	ArrayList<Board> findByTeacheridLike(Teacher teacherid);

	//제목으로 검색 
		ArrayList<Board> findBytitleLike(String title);
		
		//내용으로 검색 
		ArrayList<Board> findBycontentLike(String content);
	
}
