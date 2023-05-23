package com.example.demo.board;

import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

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
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	@Id
	@SequenceGenerator(name="seq_gen",sequenceName="seq_boardnum")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_boardnum")
	int board_num;
	
	@ManyToOne
	@JoinColumn(name="teacherid", nullable=false)
	@OnDelete(action = OnDeleteAction.SET_NULL)
	private Teacher teacherid;
	private String title;
	private Date w_date;
	private String content;
	private Date event_date;
	
	@Column(nullable=true)
	private String img1;
	@Column(nullable=true)
	private String img2;
	@Column(nullable=true)
	private String img3;
	
	@PreUpdate
	@PrePersist
	public void wdateperprocess() {
		w_date = new Date();
	}

}
