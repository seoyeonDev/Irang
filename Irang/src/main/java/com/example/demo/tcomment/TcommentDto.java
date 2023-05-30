package com.example.demo.tcomment;

import java.time.LocalDate;

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
	private int commentnum;
	private Teacherlog tlnum;
	private String comwriter;
	private String content;
	private LocalDate comdate;
}
