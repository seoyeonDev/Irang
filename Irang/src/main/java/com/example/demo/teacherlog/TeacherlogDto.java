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
	private Teacher teacherid; // 테이블 추가하면 entity명 고쳐 적기
	private Child childid; // 테이블 추가하면 entity명 고쳐 적기
	private LocalDate tdate;
	private String activity;
	private String health;
	private String img1;
	private String img2;
	private String img3;
	private MultipartFile[] f = new MultipartFile[3];
}
