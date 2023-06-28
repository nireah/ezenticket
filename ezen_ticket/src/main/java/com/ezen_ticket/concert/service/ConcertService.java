package com.ezen_ticket.concert.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ezen_ticket.concert.vo.ConcertVO;
import com.webjjang.util.PageObject;

public interface ConcertService {

	public List<ConcertVO> list(String category, HttpSession session, PageObject pageObject);
	public List<ConcertVO> search(String search, HttpSession session, PageObject pageObject);
	public List<ConcertVO> listDate(long no, HttpSession session);
	
	public ConcertVO view(long no);
	public ConcertVO viewDate(Long dno);
	
	public int write(ConcertVO vo);
	public int writeDate(ConcertVO vo);
	
	public long findNo();
	
	public int update(ConcertVO vo);
	public int updateImage(ConcertVO vo);
	public int updateDate(ConcertVO vo);
	
	public int delete(long no);
	public int deleteDate(long dno);
	
	public List<Boolean> check(Long no);
	public List<Boolean> check2(Long dno);
	
}
