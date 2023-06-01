package com.example.demo.childlog;

import java.time.LocalDate;
import java.util.Date;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.example.demo.child.Child;

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
public class Childlog {        
	@Id
	@SequenceGenerator(name="seq_chlog", sequenceName="seq_chlog", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_chlog")
	private int chlognum;
	
	@ManyToOne
	@JoinColumn(name="childid", nullable=false)
	@OnDelete(action=OnDeleteAction.CASCADE)
	private Child childid;
	
//	@ManyToOne
//	@JoinColumn(name="teacherid", nullable=false)
//	@OnDelete(action=OnDeleteAction.CASCADE)
//	private Teacher teacherid;
	
	private LocalDate wdate;
	private String content;
	private String img;
	private int tcheck; // 선생님이 읽었는지 확인~ (0 미확인 / 1 확인)
	
	@PreUpdate
	@PrePersist
	public void wdateperprocess() {
		wdate = LocalDate.now(); // sysdate
	}

}
