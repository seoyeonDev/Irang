package com.example.demo.tcomment;

import java.util.Date;

import com.example.demo.teacherlog.Teacherlog;

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
public class TcommentDto {
	private int commentNum;
	private Teacherlog tl_num;
	private String comWriter;
	private String content;
	private Date comDate;
}
