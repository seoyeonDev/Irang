package com.example.demo.board;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.teacher.Teacher;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
	
	int bnum;
	private int mgnum;
	private Teacher teacherid;
	private String title;
	private LocalDate wdate;
	private String content;
	private LocalDate edate;
	private String img1;
	private String img2;
	private String img3;
	
	private MultipartFile [] imgf = new MultipartFile[3];


}
