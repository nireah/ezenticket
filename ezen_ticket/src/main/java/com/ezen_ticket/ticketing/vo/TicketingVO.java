package com.ezen_ticket.ticketing.vo;

import lombok.Data;

@Data
public class TicketingVO {
//public class TicketingVO<T> implements Comparable<T> {
	
	private Long ticketNo, tno, dno;
	private String id, name, local, concertDate, placeName;
	private long cnt, price, fee, total;
	private String type, seatGrade, seatNo, ticketDate;
	
//	
//	@SuppressWarnings("rawtypes")
//	@Override
//	public int compareTo(T o) {
//		TicketingVO t = (TicketingVO) o;
//		return (int) (t.getTicketNo() - this.getTicketNo());
//	}
	
}
