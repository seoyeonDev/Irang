package com.example.demo.tcomment;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.teacherlog.Teacherlog;

@Repository
public interface TcommentDao extends JpaRepository<Tcomment, Integer> {
	ArrayList<Tcomment> findByTlnum(Teacherlog tlnum);
	ArrayList<Tcomment> findByComdate(LocalDate comdate);
}
