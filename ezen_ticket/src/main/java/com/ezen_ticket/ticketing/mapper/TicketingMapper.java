package com.ezen_ticket.ticketing.mapper;

import java.util.List;

import com.ezen_ticket.concert.vo.ConcertVO;
import com.ezen_ticket.member.vo.MemberVO;
import com.ezen_ticket.ticketing.vo.TicketingVO;
import com.webjjang.util.PageObject;

public interface TicketingMapper {

	public ConcertVO previewD(Long dno);
	public MemberVO previewM(String id);
	
	public List<TicketingVO> list(PageObject pageObject);
	public List<TicketingVO> myList(String id);
	public long getTotalRow(PageObject pageObject);
	
	public TicketingVO view(Long ticketNo);
	public List<TicketingVO> viewSeat(Long ticketNo);
	
	public int write(TicketingVO vo);
	public int writeSeat(TicketingVO vo);
	public Long findNo();
	public List<String> check(Long dno);
	
	public int delete(Long ticketNo);
	
}
