package com.example.demo.board;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.teacher.Teacher;

@Repository
public interface BoardDao extends JpaRepository <Board, Integer>{
	
	// 이벤트 날짜로 검색
	ArrayList<Board> findByEdate(LocalDate edate);
	
	//작성자로 검색 
	ArrayList<Board> findByTeacherid(Teacher teacherid);
	
	//작성자로 검색 
	//ArrayList<Board> findByTeacherid(Teacher teacherid);
	
	//ArrayList<Board> findByTeacherid_teacheridLike(String teacherid);


	//제목으로 검색 
	ArrayList<Board> findBytitleLike(String title);
		
	//내용으로 검색 
	ArrayList<Board> findBycontentLike(String content);


	
}
