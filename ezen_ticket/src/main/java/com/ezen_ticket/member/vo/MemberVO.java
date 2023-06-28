package com.ezen_ticket.member.vo;

import java.util.Date;

import lombok.Data;


@Data
public class MemberVO {

	private String id, pw, name, profileImage, gender, birth, tel;
	private long point;
	private Date regDate, conDate;
	private String status, gradeName;
	private long gradeNo;
	
}
