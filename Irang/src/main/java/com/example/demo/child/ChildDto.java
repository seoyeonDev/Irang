package com.example.demo.child;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.Irangclass.Irangclass;

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
public class ChildDto {
	private String childid;//아이의 계정id
	private String pwd;//아이의 계정 pwd
	private String name;//아이의 이름
	private String pname;//아이부모의 이름
	private Date birthday;//아이의 생일
	private String phone;//아이부모의 전화번호
	private String allergy;//아이의 알러지정보
	private Irangclass classnum;//아이의 반정보
	private String img;
	private MultipartFile f;
}
