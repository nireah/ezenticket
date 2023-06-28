package com.ezen_ticket.member.vo;

import java.util.Date;

import lombok.Data;


@Data
public class LoginVO {

	private String id, pw, name;
	private Date regDate, conDate;
	private String status, gradeName;
	private long gradeNo;
	
}
