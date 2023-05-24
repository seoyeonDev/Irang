package com.example.demo.teacher;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.Irangclass.Irangclass;

import jakarta.annotation.Nullable;
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
public class TeacherDto {

	private String teacherid;
	private String name;
	private String pwd;
	private String phone;
	private Irangclass classnum;
	private String profile;
	@Nullable
	private MultipartFile f ;
}
