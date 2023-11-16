package com.klu.model;

import java.util.ArrayList; 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.klu.entity.Erp;
import com.klu.repository.erprepository;

@Service
public class ErpManager {

	@Autowired
	erprepository er;
	
	public boolean checkingrollno(long rollno)
	{
		String rn = er.checklist(rollno);
		if(rn==null)
			return false;
		else
			return true;
	}
	
	public List<String> getDetails(Long rollno){
		List<String> list = new ArrayList<String>();
		for(Erp e: er.verifying(rollno))
			list.add(toJsonString(e));
		return list;
		
	}
	
	
	
	public String toJsonString(Object obj)
	{
		GsonBuilder gbuilder = new GsonBuilder();
		Gson gson = gbuilder.create();
		return gson.toJson(obj);
	}
	
}
