package com.sps.vo;


public class ClientVO {

	private int client_idx; 				// 고객 인덱스			
	private String client_name;				// 고객 이름
	private String client_id;				// 고객 아이디			
	private String client_email;			// 고객 이메일			
	private String client_password;			// 고객 비밀번호
	private String client_birthday;			// 고객 생일
	private String client_phoneNumber;		// 고객 핸드폰번호
	private String client_address;			// 고객 주소
	private String client_addressNumber;    // 고객 우편번호
	private String client_detailAddress;	// 고객 상세 주소
	private String client_registerDate;		// 고객 가입 날짜
	
	
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
	
	


	public String getClient_addressNumber() {
		return client_addressNumber;
	}


	public void setClient_addressNumber(String client_addressNumber) {
		this.client_addressNumber = client_addressNumber;
	}


	public String getClient_registerDate() {
		return client_registerDate;
	}


	public void setClient_registerDate(String client_registerDate) {
		this.client_registerDate = client_registerDate;
	}

	public String getClient_email() {
		return client_email;
	}


	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}


	public String getClient_detailAddress() {
		return client_detailAddress;
	}


	public void setClient_detailAddress(String client_detailAddress) {
		this.client_detailAddress = client_detailAddress;
	}


	@Override
	public String toString() {
		return "ClientVO [client_idx=" + client_idx + ", client_name=" + client_name + ", client_id=" + client_id
				+ ", client_email=" + client_email + ", client_password=" + client_password + ", client_birthday="
				+ client_birthday + ", client_phoneNumber=" + client_phoneNumber + ", client_address=" + client_address
				+ ", client_addressNumber=" + client_addressNumber + ", client_detailAddress=" + client_detailAddress
				+ ", client_registerDate=" + client_registerDate + "]";
	}
	
	
}
