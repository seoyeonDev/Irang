package com.example.demo.teacher;

import com.example.demo.Irangclass.Irangclass;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
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
}
