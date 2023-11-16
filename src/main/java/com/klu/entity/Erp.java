package com.klu.entity;

import javax.persistence.Entity; 
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="erp")
public class Erp {
	@Id
	private long id;
	private long rollno;
	private String name;
	private String branch;
	private long phn;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getRollno() {
		return rollno;
	}
	public void setRollno(long rollno) {
		this.rollno = rollno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public long getPhn() {
		return phn;
	}
	public void setPhn(long phn) {
		this.phn = phn;
	}
	@Override
	public String toString() {
		return "Erp [id=" + id + ", rollno=" + rollno + ", name=" + name + ", branch=" + branch + ", phn=" + phn + "]";
	}
	
  
}
