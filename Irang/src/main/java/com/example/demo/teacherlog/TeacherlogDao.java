package com.example.demo.teacherlog;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.child.Child;
import com.example.demo.childlog.Childlog;
import com.example.demo.teacher.Teacher;

@Repository
public interface TeacherlogDao extends JpaRepository<Teacherlog, Integer> {
	// 선생님 : 일지 리스트
	ArrayList<Teacherlog> findByTeacheridOrderByTlnumDesc(Teacher teacherid);
	
	// 보호자 : 일지 리스트
	ArrayList<Teacherlog> findByChildidOrderByTlnumDesc(Child childid);
	
	// 선생님 : 특정 아이 select 
	ArrayList<Teacherlog> findByTeacheridAndChildidOrderByTlnumDesc(Teacher teacherid, Child childid);
	
	// 선생님 : 특정 날짜 검색 
	ArrayList<Teacherlog> findByTeacheridAndTdateOrderByTlnumDesc(Teacher teacherid, LocalDate tdate);
	
	// 아이 : 특정 날짜 검색
	ArrayList<Teacherlog> findByChildidAndTdateOrderByTlnumDesc(Child childid, LocalDate tdate);
	
	// 선생님 : 월별 검색
	ArrayList<Teacherlog> findByTeacheridAndTdateBetweenOrderByTlnumDesc(Teacher teacherid, LocalDate start, LocalDate end);
	
	// 아이 : 월별 검색
	ArrayList<Teacherlog> findByChildidAndTdateBetweenOrderByTlnumDesc(Child childid, LocalDate start, LocalDate end);
}
