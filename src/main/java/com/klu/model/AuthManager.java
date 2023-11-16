package com.klu.model;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.klu.entity.Anthetication;
import com.klu.repository.AuthRepository;

@Service
public class AuthManager {

	@Autowired
	AuthRepository ar;
	
	public String Registerfaculity(Anthetication a)
	{
		try {
			ar.save(a);
			return null;
		} catch (Exception e) {
			return e.getMessage();
		}
	}
	
	public int getdetailsId(String s)
	{
			return ar.getdetails(s);
	}
	
}
