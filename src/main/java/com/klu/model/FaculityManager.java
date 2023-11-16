package com.klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.entity.Faculity;
import com.klu.repository.faculityrepository;

@Service
public class FaculityManager {

	@Autowired
	faculityrepository fr;
	
	public String Registerfaculity(Faculity f)
	{
		try {
			fr.save(f);
			return null;
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	public boolean LoginFaculity(Long rn,String pass) {
		String roll = fr.Login(rn, pass);
		if(roll!=null)
			return true;
		else
			return false;
	}
	 
}
