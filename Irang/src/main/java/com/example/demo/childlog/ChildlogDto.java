package com.example.demo.childlog;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.child.Child;

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
	private LocalDate wdate;
	private String content;
	private String img;
	private int tcheck;
	
	private MultipartFile f;


}
