package com.klu.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.entity.timetable;

@Repository
public interface TimetableRepository extends JpaRepository<timetable, Long>{
	
	@Query("select tt from timetable tt where tt.date=:dte and tt.rollno=:rn")
	public List<timetable> readtimings(@Param("dte") String dte,@Param("rn") long rn);

}
