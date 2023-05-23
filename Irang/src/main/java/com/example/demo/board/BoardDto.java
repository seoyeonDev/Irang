package com.example.demo.board;

import java.util.Date;

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
	
	int board_num;
	private Teacher teacherid;
	private String title;
	private Date w_date;
	private String content;
	private Date event_date;
	private String img1;
	private String img2;
	private String img3;
	private MultipartFile [] f = new MultipartFile[3];


}
