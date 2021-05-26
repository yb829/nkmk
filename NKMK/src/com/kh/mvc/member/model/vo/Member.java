package com.kh.mvc.member.model.vo;




import java.util.Date;

import lombok.*;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor



public class Member {
    
	private int no;
	
	private String id;
	
	private String role;
	
	private String email;
	
	private String password;
	
	private String name;
	
	private String phone;
	
	private String nickName;
	
	private String gender;
	
	private int age;
	
	private String address;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	private String regular_delivery;
	
	private String status;
	


	private String petName; //펫부분 추가 
	
	private String petBirth;
	
	private String petType;
	
	private String petSort;
	
	private String petGender;
	
	private String petNeutralization;
	
	private String petConcern;
	
	private String  emailAgree;   //수신동의 추가 
	
	private String  smsAgree;
	
	private String terms1; //약관동의
	
	private String terms2;

	
	}
	


	
	
	
	

	
	
	
	
