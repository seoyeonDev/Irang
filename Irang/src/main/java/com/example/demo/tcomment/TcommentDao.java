package com.example.demo.tcomment;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TcommentDao extends JpaRepository<Tcomment, Integer> {
	//ArrayList<Tcomment> findByTl_num(int num);
}
