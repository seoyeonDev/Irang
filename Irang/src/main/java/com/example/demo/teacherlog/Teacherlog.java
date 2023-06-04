package com.example.demo.teacherlog;

import java.time.LocalDate;
import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.example.demo.child.Child;
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
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Teacherlog {
	@Id
	@SequenceGenerator(name="seq_gen", sequenceName="seq_tlog", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_tlog")
	private int tlnum;
	
	@ManyToOne
	@JoinColumn(name="teacherid", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Teacher teacherid;	// 테이블 추가하면 entity명 고쳐 적기 
	
	@ManyToOne
	@JoinColumn(name="childid", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Child childid;	// 테이블 추가하면 entity명 고쳐 적기 
	
	private LocalDate tdate;
	private String activity;
	private String health;
	@Column(nullable=true)
	private String img1;
	@Column(nullable=true)
	private String img2;
	@Column(nullable=true)
	private String img3;
}
