package com.klu.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.klu.entity.timetable;
import com.klu.repository.TimetableRepository;

@Service
public class TimetableManager {

	@Autowired
	TimetableRepository ttr;
	
	public List<String> readtimings(String dte,long rn){
		List<String> list = new ArrayList<String>();
		for(timetable tt: ttr.readtimings(dte,rn))
			list.add(toJsonString(tt));
		return list;
		
	}
	
	
	
	public String toJsonString(Object obj)
	{
		GsonBuilder gbuilder = new GsonBuilder();
		Gson gson = gbuilder.create();
		return gson.toJson(obj);
	}
	
}
