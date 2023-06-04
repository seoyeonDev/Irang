package com.example.demo.Irangclass;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
public class Irangclass {

	@Id
	@SequenceGenerator(name="seq_irangclass", sequenceName="seq_irangclass", initialValue=2, allocationSize = 1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seq_irangclass")
	private int classnum;
	private String classname;
	
}
