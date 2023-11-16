package com.klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.klu.model.manager;

@RestController
@RequestMapping("/api")
public class controller {
     
	@Autowired
	manager m;
	
	@GetMapping("/employee/{ename}/{epass}")
	public String login(@PathVariable("ename") String name,@PathVariable("epass") String epass) {
		String p = m.login(name, epass);
		if(p!=null)
			return "successfully Login";
		else
			return "Error";
	}
}
