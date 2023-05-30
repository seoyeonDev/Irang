package com.example.demo.child;

import java.util.ArrayList;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.Irangclass.Irangclass;
@Repository
public interface ChildDao extends JpaRepository<Child, String> {
	ArrayList<Child> findByClassnum(Irangclass classnum);
	ArrayList<Child> findByNameLike(String name);
}
