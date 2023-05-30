package com.example.demo.board;


import java.time.LocalDate;
import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import com.example.demo.teacher.Teacher;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	@Id
	@SequenceGenerator(name="seq_gen",sequenceName="seq_boardnum", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_boardnum")
	int bnum;
	private int mgnum;
	
	@ManyToOne
	@JoinColumn(name="teacherid", nullable=false)
	@OnDelete(action = OnDeleteAction.SET_NULL)
	private Teacher teacherid;
	private String title; //수정 
	
	private LocalDate wdate;
	
	private String content; //수정 
	
	//@Temporal(TemporalType.DATE)
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate edate; //수정 
	
	@Column(nullable=true)
	private String img1; //수정 
	@Column(nullable=true)
	private String img2;//수정 
	@Column(nullable=true)
	private String img3;//수정 

	
	
	
	@PreUpdate
	@PrePersist
	public void wdateperprocess() {
		 wdate =  LocalDate.now();
	}

}
