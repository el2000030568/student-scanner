package com.klu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.entity.Erp;

@Repository

public interface erprepository extends JpaRepository<Erp, Long> {
     
	@Query("select rollno from Erp e where e.rollno=:rn")
	public String checklist(@Param("rn") Long rollno);
	
	@Query("select e from Erp e where e.rollno=:rn")
	public List<Erp> verifying(@Param("rn") Long rollno);
}
