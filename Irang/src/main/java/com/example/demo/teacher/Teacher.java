package com.example.demo.teacher;

import com.example.demo.Irangclass.Irangclass;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Teacher {

	@Id
	private String teacherid;
	private String name;
	private String pwd;
	private String phone;
	// 부모 엔티티 삭제 전 자식 엔티티를 찾고 해당 값을 null 로 처리
	@OneToOne //조인의 연관 방법
	@JoinColumn(nullable=true)
	private Irangclass classnum;
	private String profile;
}
