package com.ezen_ticket.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen_ticket.member.service.MemberService;
import com.ezen_ticket.member.vo.LoginVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	
	@Autowired
	@Qualifier("memberServiceImpl")
	private MemberService service;
	
	
	@GetMapping("/login.do")
	public String loginForm() {
		
		return "member/login";
		
	}
	
	
	@PostMapping("/login.do")
	public String login(String id, String pw, HttpSession session, RedirectAttributes rttr) {
		
		LoginVO vo = new LoginVO();
		vo.setId(id);
		vo.setPw(pw);
		
		LoginVO loginVO = service.login(vo);
		
		if(loginVO != null) {
			session.setAttribute("login", loginVO);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg", 1);
			return "redirect:login.do";
		}
		
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("login");
		
		return "redirect:/";
	}
	
}
