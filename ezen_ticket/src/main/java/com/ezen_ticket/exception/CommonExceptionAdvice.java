package com.ezen_ticket.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;
import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {

	// 500번 예외 전체 - Exception
	@ExceptionHandler(Exception.class)
	public String exception(Exception e, Model model) {
		
		log.error("Exception.....");
		model.addAttribute("exception", e);
		log.error(model);
		
		return "error/error_page";
	}
	
	
	// 404번 오류 처리
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException e) {
		
		log.error("404 Error");
		
		return "error/custom404";
	}
	
}
