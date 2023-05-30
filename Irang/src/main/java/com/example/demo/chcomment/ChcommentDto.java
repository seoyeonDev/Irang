package com.example.demo.chcomment;

import java.util.Date;

import com.example.demo.childlog.Childlog;

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
public class ChcommentDto {
	private int num;
	private Childlog chlognum; // 원글 번호 
	private String writer;
	private String content;
	private Date wdate;

}
