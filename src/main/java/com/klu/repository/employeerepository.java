package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klu.entity.employee;

@Repository

public interface employeerepository extends JpaRepository<employee, Long> {
         @Query("select name from employee e where e.name =:ename and e.password =:epass")
         public String Login(@Param("ename") String name,@Param("epass") String pass);
}
