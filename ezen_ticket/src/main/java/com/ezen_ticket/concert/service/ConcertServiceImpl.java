package com.ezen_ticket.concert.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ezen_ticket.concert.mapper.ConcertMapper;
import com.ezen_ticket.concert.vo.ConcertVO;
import com.ezen_ticket.member.vo.LoginVO;
import com.webjjang.util.PageObject;

@Service
@Qualifier("concertServiceImpl")
public class ConcertServiceImpl implements ConcertService {

	@Inject
	private ConcertMapper mapper;
	
	@Override
	public List<ConcertVO> list(String category, HttpSession session, PageObject pageObject) {
		
		long gradeNo = 0;
		if(((LoginVO)(session.getAttribute("login"))) != null) {
			gradeNo = ((LoginVO)(session.getAttribute("login"))).getGradeNo();
		}
		
		if(gradeNo == 9) {
			pageObject.setTotalRow(mapper.getTotalRow(category, pageObject));
			return mapper.listAdmin(category, pageObject);
		} else {
			return mapper.list(category);
		}
		
	}

	@Override
	public List<ConcertVO> search(String search, HttpSession session, PageObject pageObject) {
		
		long gradeNo = 0;
		if(((LoginVO)(session.getAttribute("login"))) != null) {
			gradeNo = ((LoginVO)(session.getAttribute("login"))).getGradeNo();
		}
		
		if(gradeNo == 9) {
			pageObject.setTotalRow(mapper.getTotalRow2(search, pageObject));
			return mapper.searchAdmin(search, pageObject);
		} else {
			return mapper.search(search);
		}
	}
	
	@Override
	public List<ConcertVO> listDate(long no, HttpSession session) {
		
		long gradeNo = 0;
		if(((LoginVO)(session.getAttribute("login"))) != null) {
			gradeNo = ((LoginVO)(session.getAttribute("login"))).getGradeNo();
		}
		
		if(gradeNo == 9) {
			return mapper.listDateAdmin(no);
		} else {
			return mapper.listDate(no);
		}
		
	}
	
	@Override
	public ConcertVO view(long no) {
		return mapper.view(no);
	}

	@Override
	public ConcertVO viewDate(Long dno) {
		return mapper.viewDate(dno);
	}
	
	@Override
	public int write(ConcertVO vo) {
		return mapper.write(vo);
	}

	@Override
	public int writeDate(ConcertVO vo) {
		return mapper.writeDate(vo);
	}

	@Override
	public long findNo() {
		return mapper.findNo();
	}

	@Override
	public int update(ConcertVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int updateImage(ConcertVO vo) {
		return mapper.updateImage(vo);
	}
	
	@Override
	public int updateDate(ConcertVO vo) {
		return mapper.updateDate(vo);
	}
	
	@Override
	public int delete(long no) {
		return mapper.delete(no);
	}

	@Override
	public int deleteDate(long dno) {
		return mapper.deleteDate(dno);
	}

	@Override
	public List<Boolean> check(Long no) {
		return mapper.check(no);
	}

	@Override
	public List<Boolean> check2(Long dno) {
		return mapper.check2(dno);
	}

}
