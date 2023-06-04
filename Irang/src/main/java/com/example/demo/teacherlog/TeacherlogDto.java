package com.example.demo.teacherlog;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.child.Child;
import com.example.demo.teacher.Teacher;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TeacherlogDto {
	private int tlnum;
	private Teacher teacherid; 
	private Child childid; 
	private LocalDate tdate;
	private String activity;
	private String health;
	private String img1;
	private String img2;
	private String img3;
	private MultipartFile[] f = new MultipartFile[3];
}
