package com.klu.controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.klu.entity.Anthetication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.klu.entity.Faculity;
import com.klu.model.AuthManager;
import com.klu.model.ErpManager;
import com.klu.model.FaculityManager;
import com.klu.model.TimetableManager;

@RestController
@RequestMapping("/api")
public class Restfull {

	@Autowired
	ErpManager em;
	@Autowired
	FaculityManager fm;
	@Autowired
	TimetableManager ttm;
	@Autowired
	AuthManager am;
	
	
	
	public static long rollno = 0;
	public static int auth_id;
	
	@GetMapping("/register/{rollno}")
	public String checkinginerp(@PathVariable("rollno") long rn)
	{
		if(em.checkingrollno(rn))
			return "Successfull";
		else
			return "Not Registered in ERP";
	} 
	
	@PostMapping("/register")
	public String registerfact(@RequestBody Faculity f)
	{
		String p = fm.Registerfaculity(f);
		if(p == null)
			return null;
		else
			return "Already Exists!";
	}
	
	@GetMapping("/LoginFaculity/{rn}/{pass}")
	public String LoginFaculity(@PathVariable("rn") Long roll,@PathVariable("pass") String pass)
	{
		if(fm.LoginFaculity(roll, pass))
		{
			rollno = roll;
			return null;
		}
		else
			return "error";
	}
	
	@GetMapping("/GetErp")
	public String getErp() {
		return em.getDetails(rollno).toString();
	}
	
	@GetMapping("/ReadTimings/{date}")
	public String readtimings(@PathVariable("date") String dte)
	{
		return ttm.readtimings(dte, rollno).toString();
	}
	@PostMapping("/anthecation")
	public void readauth(@RequestBody Anthetication a) {
		am.Registerfaculity(a);
	}
	@GetMapping("/anthecation/getid/{s}")
	public void getidauth(@PathVariable("s") String s)
	{
		auth_id = am.getdetailsId(s);
	}
	
}
