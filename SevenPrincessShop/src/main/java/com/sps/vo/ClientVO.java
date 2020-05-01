package com.sps.vo;

import java.sql.Date;

public class ClientVO {

	private int client_idx; 			
	private String client_name;			
	private String client_id;				
	private String client_password;			
	private String client_birthday;			
	private String client_phoneNumber;		
	private String client_address;			
	private String client_registerDate;		
	
	
	public int getClient_idx() {
		return client_idx;
	}


	public void setClient_idx(int client_idx) {
		this.client_idx = client_idx;
	}


	public String getClient_name() {
		return client_name;
	}


	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}


	public String getClient_id() {
		return client_id;
	}


	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}


	public String getClient_password() {
		return client_password;
	}


	public void setClient_password(String client_password) {
		this.client_password = client_password;
	}


	public String getClient_birthday() {
		return client_birthday;
	}


	public void setClient_birthday(String client_birthday) {
		this.client_birthday = client_birthday;
	}


	public String getClient_phoneNumber() {
		return client_phoneNumber;
	}


	public void setClient_phoneNumber(String client_phoneNumber) {
		this.client_phoneNumber = client_phoneNumber;
	}


	public String getClient_address() {
		return client_address;
	}


	public void setClient_address(String client_address) {
		this.client_address = client_address;
	}


	public String getClient_registerDate() {
		return client_registerDate;
	}


	public void setClient_registerDate(String client_registerDate) {
		this.client_registerDate = client_registerDate;
	}


	@Override
	public String toString() {
		return "ClientVO [client_idx=" + client_idx + ", client_name=" + client_name + ", client_id=" + client_id
				+ ", client_password=" + client_password + ", client_birthday=" + client_birthday
				+ ", client_phoneNumber=" + client_phoneNumber + ", client_address=" + client_address
				+ ", client_registerDate=" + client_registerDate + "]";
	}
	
	
	
}
