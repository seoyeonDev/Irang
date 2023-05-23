package com.example.demo.board;

import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

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
	int Board_num;
	
	@ManyToOne
	@JoinColumn(name="Teach_id", nullable=false)
	@OnDelete(action = OnDeleteAction.SET_NULL)
	private Teacher Teacher_id;
	private String Title;
	private Date w_date;
	private String Content;
	private Date event_date;
	
	@PreUpdate
	@PrePersist
	public void wdateperprocess() {
		w_date = new Date();
	}

}
