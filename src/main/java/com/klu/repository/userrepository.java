package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klu.entity.users;

@Repository
public interface userrepository extends JpaRepository<users, Long>{

}
