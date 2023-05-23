package com.example.demo.tcomment;

import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.example.demo.teacherlog.Teacherlog;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.SequenceGenerator;
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
public class Tcomment{
	@Id
	@SequenceGenerator(name="seq_gen", sequenceName="seq_tcomment", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_tcomment")
	private int commentNum;
	@ManyToOne
	@JoinColumn(name="tl_num", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Teacherlog tl_num;
	// 작성자... 아이디를 가져올까 닉네임을 가져올까..둘 다 가져올까?
	private String comWriter;
	private String content;
	private Date comDate;
}
