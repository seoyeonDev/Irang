package com.example.demo.childlog;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.child.Child;

@Repository
public interface ChildlogDao extends JpaRepository<Childlog, Integer> {
	// childid로 검색 -- 전체 리스트 
	ArrayList<Childlog> findByChildidOrderByChlognumDesc(Child childid);
	
	// childid 와 날짜로 검색 (기간)
	ArrayList<Childlog> findByChildidAndWdateBetweenOrderByChlognumDesc(Child childid, LocalDate start, LocalDate end);
	
	// childid 와 날짜 검색 (월별)
	ArrayList<Childlog> findByChildidAndWdateLikeOrderByChlognumDesc(Child childid, String month);
	
	// tcheck 가 0인거 검색 
	ArrayList<Childlog> findByChildidAndTcheckOrderByChlognumDesc(Child childid, int tcheck);
}
