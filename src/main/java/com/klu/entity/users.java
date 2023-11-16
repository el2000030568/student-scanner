package com.klu.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class users {
@Id
private long id;
private long billno;
private String name;
private String password;
private long phno;
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public long getBillno() {
	return billno;
}
public void setBillno(long billno) {
	this.billno = billno;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public long getPhno() {
	return phno;
}
public void setPhno(long phno) {
	this.phno = phno;
}
@Override
public String toString() {
	return "users [id=" + id + ", billno=" + billno + ", name=" + name + ", password=" + password + ", phno=" + phno
			+ "]";
}

}
