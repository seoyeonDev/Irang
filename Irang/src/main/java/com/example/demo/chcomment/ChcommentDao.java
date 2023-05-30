package com.example.demo.chcomment;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.childlog.Childlog;

@Repository
public interface ChcommentDao extends JpaRepository<Chcomment, Integer> {
	// 일지 글번호로 검색 
	ArrayList<Chcomment> findByChlognum(Childlog chlognum);

}
