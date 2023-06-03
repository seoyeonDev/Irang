package com.example.demo.chcomment;

import java.time.LocalDate;
import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.example.demo.childlog.Childlog;

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
@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Chcomment {
	@Id
	@SequenceGenerator(name="seq_chcom", sequenceName="seq_chcom", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_chcom")
	private int num;
	
	@ManyToOne
	@JoinColumn(name="chlognum", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Childlog chlognum; // 원글 번호 
	
	private String id; 
	private String name;
	private String content;
	private LocalDate wdate;
	
	@PreUpdate
	@PrePersist
	public void wdateperprocess() {
		wdate = LocalDate.now();
	}

}
