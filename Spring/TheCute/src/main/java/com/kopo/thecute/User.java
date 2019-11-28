package com.kopo.thecute;

public class User {
	public int idx;
	public String id;
	public String password;
	public String birthday;
	public String name;
	
	User() {
		
	}
	
	User(String id, String password, String birthday, String name){
		this.id = id;
		this.password = password;
		this.birthday = birthday;
		this.name = name;
	}
}
