package com.klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.repository.employeerepository;

@Service
public class manager {
	@Autowired
	employeerepository er;
	
	public String login(String name,String password) {
		return er.Login(name, password);
	}

}
