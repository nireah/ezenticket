package com.ezen_ticket.concert.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ezen_ticket.concert.vo.ConcertVO;
import com.webjjang.util.PageObject;

public interface ConcertMapper {

	public List<ConcertVO> list(String category);
	public List<ConcertVO> listAdmin(@Param("category") String category, @Param("pageObject") PageObject pageObject);
	public List<ConcertVO> search(String search);
	public List<ConcertVO> searchAdmin(@Param("search") String search, @Param("pageObject") PageObject pageObject);
	public List<ConcertVO> listDate(long no);
	public List<ConcertVO> listDateAdmin(long no);
	public long getTotalRow(@Param("category") String category, @Param("pageObject") PageObject pageObject);
	public long getTotalRow2(@Param("search") String search, @Param("pageObject") PageObject pageObject);
	
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
