package com.example.demo.childlog;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.child.Child;
import com.example.demo.teacher.Teacher;

@Repository
public interface ChildlogDao extends JpaRepository<Childlog, Integer> {
	// childid로 검색 -- 전체 리스트 
	ArrayList<Childlog> findByChildidOrderByChlognumDesc(Child childid);
	
	// childid 와 날짜로 검색
	
	// tcheck 가 0인거 검색 
	ArrayList<Childlog> findByTcheckOrderByChlognumDesc(int tcheck);
}
