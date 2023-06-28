package com.ezen_ticket.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ezen_ticket.member.mapper.MemberMapper;
import com.ezen_ticket.member.vo.LoginVO;

import lombok.Setter;

@Service
@Qualifier("memberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public LoginVO login(LoginVO vo) {
		
		return mapper.login(vo);
	}

}
