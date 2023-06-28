package com.ezen_ticket.concert.vo;


import lombok.Data;


@Data
public class ConcertVO {
	
	private Long no;
	private String category, name, actor, content, image;
	private long placeNo;
	private String placeName, concertDate, runtime, age;
	private long tour;
	private Long priceR, priceS, priceA, dno, tno;
	private String local;
	
}
