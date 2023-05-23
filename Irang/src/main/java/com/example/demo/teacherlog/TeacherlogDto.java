package com.example.demo.teacherlog;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TeacherlogDto {
	private int tl_num;
	private Teacher teacher_id; // 테이블 추가하면 entity명 고쳐 적기
	private Child child_id; // 테이블 추가하면 entity명 고쳐 적기
	private Date tdate;
	private String activity;
	private String health;
	private String img1;
	private String img2;
	private String img3;
	private MultipartFile[] f = new MultipartFile[3];
}
