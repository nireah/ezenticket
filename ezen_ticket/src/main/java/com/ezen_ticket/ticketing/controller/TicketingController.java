package com.ezen_ticket.ticketing.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen_ticket.concert.vo.ConcertVO;
import com.ezen_ticket.member.vo.LoginVO;
import com.ezen_ticket.ticketing.service.TicketingService;
import com.ezen_ticket.ticketing.vo.TicketingVO;
import com.webjjang.util.PageObject;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/ticketing")
@Log4j
public class TicketingController {

	@Autowired
	@Qualifier("ticketingServiceImpl")
	private TicketingService service;
	
	
	// 예매-----------------------------------------------------------------------
	@GetMapping("/seat.do")
	public String seatForm(long placeNo, Long dno, Model model, HttpServletRequest request) {
		model.addAttribute("dno", dno);
		request.setAttribute("seats", service.check(dno));
		
//		if(placeNo == 1) {
//			return "ticketing/seat1";
//		} else if(placeNo == 2) {
//			return "ticketing/seat2";
//		} else if(placeNo == 3) {
//			return "ticketing/seat3";
//		} else
//			return "error/404";
		
		return "ticketing/seat" + placeNo;
	}
	
	@PostMapping("/info.do")
	public String info(TicketingVO vo, Model model, HttpSession session) {
		
		model.addAttribute("dvo", service.previewD(vo.getDno()));
		String id = ((LoginVO)session.getAttribute("login")).getId();
		model.addAttribute("mvo", service.previewM(id));
		model.addAttribute("vo", vo);
		
		return "ticketing/info";
	}
	
	@GetMapping("/pay.do")
	public String payForm(TicketingVO vo, ConcertVO cvo, Model model) {
		
		model.addAttribute("vo", vo);
		model.addAttribute("cvo", cvo);
		
		return "ticketing/pay";
	}
	
	@PostMapping("/pay.do")
	public String pay(TicketingVO vo, RedirectAttributes rttr) {
		
		// 하드코딩###############################################################
		vo.setType("신용카드");
		
		service.write(vo);
		
		Long no = service.findNo();
		vo.setTicketNo(no);
		
		
		String seatGrade = vo.getSeatGrade();
		String[] grades = seatGrade.split(",");
		String seatNo = vo.getSeatNo();
		String[] nums = seatNo.split(",");
		
		int result = 0;
		for(int i=0; i < grades.length; i++) {
			vo.setSeatGrade(grades[i]);
			vo.setSeatNo(nums[i]);
			result = service.writeSeat(vo);
		}
		
		if(result == 1) {
			rttr.addFlashAttribute("msg", 1);
		} else {
			rttr.addFlashAttribute("msg", 2);
		}
		
		return "redirect:view.do?ticketNo="+no;
	}
	
	
	@RequestMapping("/agree.sub")
	public String agree() {
		return "ticketing/agree";
	}
	
	@RequestMapping("/payForm.sub")
	public String payForm() {
		return "ticketing/payForm";
	}
	
	//-------------------------------------------------------------------------
	@RequestMapping("/view.do")
	public String view(Long ticketNo, Model model) {
		
		model.addAttribute("vo", service.view(ticketNo));
		model.addAttribute("list", service.viewSeat(ticketNo));
		
		return "ticketing/view";
	}
	
	@RequestMapping("/list.do")
	public String list(Model model, HttpSession session, @ModelAttribute("pageObject") PageObject pageObject) {
		
//		List<TicketingVO> list = new ArrayList<TicketingVO>();
//		String id = ((LoginVO)(session.getAttribute("login"))).getId();
//		
//		if(((LoginVO)(session.getAttribute("login"))).getGradeNo() == 9) {
//			list.addAll(service.listD());
//			list.addAll(service.listT());
//		} else {
//			list.addAll(service.myListD(id));
//			list.addAll(service.myListT(id));
//		}
//		
//		Collections.sort(list);
//		
//		model.addAttribute("list", list);
		
		
		String id = ((LoginVO)(session.getAttribute("login"))).getId();
		
		if(((LoginVO)(session.getAttribute("login"))).getGradeNo() == 9) {
			model.addAttribute("list", service.list(pageObject));
		} else {
			model.addAttribute("list", service.myList(id));
		}
		
		return "ticketing/list";
	}
	
	@RequestMapping("/delete.do")
	public String delete(Long ticketNo, String concertDate, RedirectAttributes rttr) {
		
//		String conDate = concertDate.substring(0,2) + concertDate.substring(3,5) + concertDate.substring(6,8);
//		
//		SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
//		Date date = new Date();
//		String sysdate = format.format(date);
		
		int result = 0;
//		if(Integer.parseInt(conDate) >= (Integer.parseInt(sysdate)+7)) {
			result = service.delete(ticketNo);
//		} else {
//			rttr.addFlashAttribute("msg", 3);
//			return "redirect:view.do?ticketNo=" + ticketNo;
//		}
		
		if(result == 1) {
			rttr.addFlashAttribute("msg", 1);
		} else {
			rttr.addFlashAttribute("msg", 2);
		}
		
		return "redirect:list.do";
	}
	
}
