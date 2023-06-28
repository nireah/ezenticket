package com.ezen_ticket.ticketing.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ezen_ticket.concert.vo.ConcertVO;
import com.ezen_ticket.member.vo.MemberVO;
import com.ezen_ticket.ticketing.mapper.TicketingMapper;
import com.ezen_ticket.ticketing.vo.TicketingVO;
import com.webjjang.util.PageObject;

@Service
@Qualifier("ticketingServiceImpl")
public class TicketingServiceImpl implements TicketingService {

	@Inject
	private TicketingMapper mapper;
	

	@Override
	public ConcertVO previewD(Long dno) {
		return mapper.previewD(dno);
	}
	
	@Override
	public MemberVO previewM(String id) {
		return mapper.previewM(id);
	}
	
	@Override
	public TicketingVO view(Long ticketNo) {
		return mapper.view(ticketNo);
	}
	
	@Override
	public List<TicketingVO> viewSeat(Long ticketNo) {
		return mapper.viewSeat(ticketNo);
	}

	@Override
	public List<TicketingVO> list(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	@Override
	public List<TicketingVO> myList(String id) {
		return mapper.myList(id);
	}
	
	@Override
	public Long findNo() {
		return mapper.findNo();
	}
	
	@Override
	public List<String> check(Long dno) {
		return mapper.check(dno);
	}
	
	@Override
	public int write(TicketingVO vo) {
		return mapper.write(vo);
	}
	
	@Override
	public int writeSeat(TicketingVO vo) {
		return mapper.writeSeat(vo);
	}

	@Override
	public int delete(Long ticketNo) {
		return mapper.delete(ticketNo);
	}

	
}
