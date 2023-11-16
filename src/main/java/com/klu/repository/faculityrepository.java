package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.entity.Faculity;

@Repository
public interface faculityrepository extends JpaRepository<Faculity, Long> {

	@Query("select rollno from Faculity f where f.rollno=:rn and f.password=:pass")
	public String Login(@Param("rn") Long rollno,@Param("pass") String password);
	
}
