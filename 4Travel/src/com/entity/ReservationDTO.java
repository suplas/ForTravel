package com.entity;

public class ReservationDTO {
	private String username;
	private int phoneno;
	private int phoneno2;
	private int phoneno3;
	
	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReservationDTO(String username, int phoneno, int phoneno2, int phoneno3) {
		super();
		this.username = username;
		this.phoneno = phoneno;
		this.phoneno2 = phoneno2;
		this.phoneno3 = phoneno3;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(int phoneno) {
		this.phoneno = phoneno;
	}

	public int getPhoneno2() {
		return phoneno2;
	}

	public void setPhoneno2(int phoneno2) {
		this.phoneno2 = phoneno2;
	}

	public int getPhoneno3() {
		return phoneno3;
	}

	public void setPhoneno3(int phoneno3) {
		this.phoneno3 = phoneno3;
	}

	
	
}
