package com.example.demo.teacherlog;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.child.Child;
import com.example.demo.teacher.Teacher;

@Repository
public interface TeacherlogDao extends JpaRepository<Teacherlog, Integer> {
	ArrayList<Teacherlog> findByTeacherid(Teacher teacherid);
	ArrayList<Teacherlog> findByChildid(Child childid);
	ArrayList<Teacherlog> findByTeacheridAndChildid(Teacher teacherid, Child childid);
	ArrayList<Teacherlog> findByTdate(LocalDate tdate);
	ArrayList<Teacherlog> findByTeacheridAndTdate(Teacher teacherid, LocalDate tdate);
	ArrayList<Teacherlog> findByChildidAndTdate(Child childid, LocalDate tdate);
}
