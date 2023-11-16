package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.entity.Anthetication;

@Repository
public interface AuthRepository extends JpaRepository<Anthetication,Long>{
	
     @Query("select id from Anthetication a where a.details=:det")
     public int getdetails(@Param("det") String s);

}
