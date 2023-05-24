package com.example.demo.teacherlog;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeacherlogDao extends JpaRepository<Teacherlog, Integer> {
	ArrayList<Teacherlog> findByTeacher_id(String teacher_id);
	ArrayList<Teacherlog> findByChild_id(String child_id);
	ArrayList<Teacherlog> findByTeacher_idAndChild_id(String teacher_id, String child_id);
	
}
