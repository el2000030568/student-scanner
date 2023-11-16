package com.klu.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authentciate")
public class Anthetication {
    @Id
	private long id;
	private String details;
	private String generatedcode;
	private String qrcode;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getGeneratedcode() {
		return generatedcode;
	}
	public void setGeneratedcode(String generatedcode) {
		this.generatedcode = generatedcode;
	}
	public String getQrcode() {
		return qrcode;
	}
	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}
	@Override
	public String toString() {
		return "Anthetication [id=" + id + ", details=" + details + ", generatedcode=" + generatedcode + ", qrcode="
				+ qrcode + "]";
	}
	
	
	
}
