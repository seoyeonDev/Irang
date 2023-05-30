package com.example.demo.childlog;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.child.Child;
import com.example.demo.teacher.Teacher;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ChildlogDto {
	private int chlognum;
	private Child childid;
//	private Teacher teacherid;
	private Date wdate;
	private String content;
	private String img;
	private int tcheck;
	
	private MultipartFile f;


}
