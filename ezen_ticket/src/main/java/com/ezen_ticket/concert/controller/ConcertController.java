package com.ezen_ticket.concert.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.ezen_ticket.concert.service.ConcertService;
import com.ezen_ticket.concert.vo.ConcertVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/concert")
@Log4j
public class ConcertController {

	String path = "/upload/concert";
	
	@Autowired
	@Qualifier("concertServiceImpl")
	private ConcertService service;
	
	
	@RequestMapping("/search.do")
	public String search(String search, Model model, HttpSession session, PageObject pageObject) {
		// 기본 한 페이지 당 글 수 8로 설정
		pageObject.setPerPageNum(8);
		model.addAttribute("list", service.search(search, session, pageObject));
		// 검색어 저장
		model.addAttribute("search", search);
		return "concert/list";
	}
	
	@RequestMapping("/list.do")
	public String list(String category, Model model, HttpSession session, PageObject pageObject) {
		// 기본 한 페이지 당 글 수 8로 설정
		pageObject.setPerPageNum(8);
		model.addAttribute("list", service.list(category, session, pageObject));
		// 카테고리 저장
		model.addAttribute("category", category);
		return "concert/list";
	}
	
	@RequestMapping("/view.do")
	public String view(long no, String search, Model model, HttpSession session) {
		// view 정보 저장
		model.addAttribute("vo", service.view(no));
		// 날짜 리스트 정보 저장
		model.addAttribute("date", service.listDate(no, session));
		// 검색어 저장
		model.addAttribute("search", search);
		return "concert/view";
	}
	
	@GetMapping("/write.do")
	public String writeForm() {
		return "concert/write";
	}
	
	@PostMapping("/write.do")
	public String write(ConcertVO vo, MultipartFile file, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		// 넘어오는 이미지가 있다면
		if(!file.isEmpty()) {
			vo.setImage(FileUtil.upload(path, file, request));
		// 넘어오는 이미지가 없다면
		} else {
			// 기본 회색이미지
			vo.setImage("/upload/concert/default.jpg");
		}
		
		// 공연시간 + 분
		vo.setRuntime(vo.getRuntime() + "분");
		// 넘어오는 연령제한이 '전체관람가'라면
		if(vo.getAge().startsWith("전체관람가")) {
			vo.setAge("전체관람가");
		// 넘어오는 연령제한이 그 외 숫자라면
		} else {
			vo.setAge(vo.getAge() + "세 이상 관람가능");
		}
		
		// db에 number로 설정해놓아서 null이 못 들어가므로 null일 경우 0으로 바꿔준다.
		if(vo.getPriceR() == null) {
			vo.setPriceR((long) 0);
		}
		
		if(vo.getPriceS() == null) {
			vo.setPriceS((long) 0);
		}
		
		// 등록 서비스 실행
		int result = service.write(vo);
		
		// 실행 성공 여부에 따라 다른 msg 전달
		if(result == 1) {
			rttr.addFlashAttribute("msg", 1);
		} else {
			rttr.addFlashAttribute("msg", 2);
		}
		
		Thread.sleep(500);
		
		// 바로 view로 넘어가기 위해 no를 구하는 서비스 실행
		long no = service.findNo();
		return "redirect:view.do?no="+no+"&page=1&perPageNum=8";
	}
	
	@GetMapping("/update.do")
	public String updateForm(long no, String search, long page, long perPageNum, Model model, RedirectAttributes rttr) throws UnsupportedEncodingException {
		
		// 해당 번호에 예매된 건이 있는지 확인하는 서비스 실행
		List<Boolean> booleans = new ArrayList<Boolean>();
		booleans = service.check(no);
		
		// 예매된 건이 없는 경우에만 업데이트 진행
		if(booleans.size() == 0 || booleans.contains("false")) {
			ConcertVO vo = service.view(no);
			// 공연시간에서 맨 뒤에 '분'은 제외하고 숫자만 저장
			vo.setRuntime(vo.getRuntime().substring(0, vo.getRuntime().length()-1));
			// 제한연령이 '전체관람가'가 아닌 경우, '세 이상 관람 가능'은 제외하고 맨 앞 숫자만 저장
			if(!vo.getAge().equals("전체관람가") && vo.getAge().length() == 10) {
				// 제한연령이 한자리인 경우
				vo.setAge(vo.getAge().substring(0, 1));
			} else if(!vo.getAge().equals("전체관람가") && vo.getAge().length() == 11) {
				// 제한연령이 두자리인 경우
				vo.setAge(vo.getAge().substring(0, 2));
			}
			model.addAttribute("vo", vo);
			model.addAttribute("search", search);
			model.addAttribute("page", page);
			model.addAttribute("perPageNum", perPageNum);
			return "concert/update";
			
		// 예매된 건이 있는 경우, 해당 msg와 함께 다시 view로 이동
		} else {
			rttr.addFlashAttribute("msg", 5);
			// url 한글 엔코딩
			String url = URLEncoder.encode(search, "UTF-8");
			return "redirect:view.do?no="+no+"&search="+url+"&page="+page+"&perPageNum="+perPageNum;
		}
	}
	
	@PostMapping("/update.do")
	public String update(ConcertVO vo, String search, long page, long perPageNum, RedirectAttributes rttr) throws UnsupportedEncodingException {
		
		// db에 number로 설정해놓아서 null이 못 들어가므로 null일 경우 0으로 바꿔준다.
		if(vo.getPriceR() == null) {
			vo.setPriceR((long) 0);
		}
		
		if(vo.getPriceS() == null) {
			vo.setPriceS((long) 0);
		}
		
		vo.setRuntime(vo.getRuntime() + "분");
		// 넘어오는 연령제한이 '전체관람가'라면
		if(vo.getAge().startsWith("전체관람가")) {
			vo.setAge("전체관람가");
		// 넘어오는 연령제한이 그 외 숫자라면
		} else {
			vo.setAge(vo.getAge() + "세 이상 관람가능");
		}
		int result = service.update(vo);
		if(result == 1) {
			rttr.addFlashAttribute("msg", 3);
		} else {
			rttr.addFlashAttribute("msg", 4);
		}
		String url = URLEncoder.encode(search, "UTF-8");
		return "redirect:view.do?no="+vo.getNo()+"&search="+url+"&page="+page+"&perPageNum="+perPageNum;
	}
	
	@RequestMapping("/delete.do")
	public String delete(Long no, String category, String search, PageObject pageObject, Model model, RedirectAttributes rttr) throws UnsupportedEncodingException {
		
		// 해당 번호에 예매된 건이 있는지 확인하는 서비스 실행
		List<Boolean> booleans = new ArrayList<Boolean>();
		booleans = service.check(no);
		model.addAttribute("pageObject", pageObject);
		
		// 예매된 건이 없는 경우에만 삭제 진행
		if(booleans.size() == 0 || booleans.contains("false")) {
			service.delete(no);
			rttr.addFlashAttribute("msg", 1);
			// 검색어가 있으면 검색페이지로 이동
			if(search != null && search.length() != 0) {
				String url = URLEncoder.encode(search, "UTF-8");
				return "redirect:search.do?search="+url;
			// 검색어가 없으면 리스트로 이동
			} else {
				String url = URLEncoder.encode(category, "UTF-8");
				return "redirect:list.do?category="+url;
			}
			
		} else {
			rttr.addFlashAttribute("msg", 9);
			String url = URLEncoder.encode(search, "UTF-8");
			return "redirect:view.do?no="+no+"&search="+url+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum();
		}
		
	}
	
	//이미지------------------------------------------------------------------------------------------------
	@PostMapping("/updateImage.do")
	public String updateImage(ConcertVO vo, String search, PageObject pageObject, String deleteFile, MultipartFile changeFile, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		
		// 넘어오는 수정할 파일이 null일 경우(이미지삭제)
		if(changeFile == null) {
			// 기본 회색 이미지로 변경
			vo.setImage("/upload/concert/default.jpg");
		// 넘어오는 수정할 파일이 null이 아닐 경우(이미지수정)
		} else {
			// 넘어온 이미지로 변경
			vo.setImage(FileUtil.upload(path, changeFile, request));
		}
		
		int result = service.updateImage(vo);
		
//		if(!deleteFile.endsWith("default.jpg")) {
//			String realPath = FileUtil.getRealPath("/", deleteFile, request);
//			FileUtil.remove(realPath);
//		}
		
		// 변경 성공
		if(result == 1) {
			//수정
			if(changeFile != null) {
				rttr.addFlashAttribute("msg", 3);
			// 삭제
			} else {
				rttr.addFlashAttribute("msg", 6);
			}
		// 변경 실패
		} else {
			//수정
			if(changeFile != null) {
				rttr.addFlashAttribute("msg", 4);
			// 삭제
			} else {
				rttr.addFlashAttribute("msg", 7);
			}
		}
		String url = URLEncoder.encode(search, "UTF-8");
		return "redirect:view.do?no="+vo.getNo()+"&search="+url+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum();
	}
	
	//날짜리스트--------------------------------------------------------------------------------------------------
	@GetMapping("/writeDate.sub")
	public String writeDateForm(long no, long tour, Model model) {
		model.addAttribute("no", no);
		model.addAttribute("tour", tour);
		return "concert/writeDate";
	}
	
	@PostMapping("/writeDate.sub")
	public String writeDate(String date, String time, ConcertVO vo) {
		
		// 넘어오는 날짜와 시간데이터를 vo에 합쳐서 저장
		vo.setConcertDate(date + " " + time);
		
		// db에 number로 설정해놓아서 null이 못 들어가므로 null일 경우 0으로 바꿔준다.
		if(vo.getLocal() == null) {
			vo.setLocal("");
		}
		
		service.writeDate(vo);
		
//		if(result == 1) {
//			rttr.addFlashAttribute("msg", 1);
//		} else {
//			rttr.addFlashAttribute("msg", 2);
//		}
		
		return "redirect:rest.sub";
	}
		
	@GetMapping("/rest.sub")
	public String rest() {
		return "concert/rest";
	}
	
	@GetMapping("/updateDate.sub")
	public String updateDateForm(long no, long dno, long tour, Model model, RedirectAttributes rttr) throws ParseException {
		
		// 해당 번호에 예매된 건이 있는지 확인하는 서비스 실행
		List<Boolean> booleans = new ArrayList<Boolean>();
		booleans = service.check2(dno);
		
		if(booleans.size() == 0 || booleans.contains("false")) {
			ConcertVO vo = new ConcertVO();
			vo = service.viewDate(dno);
			model.addAttribute("vo", vo);
			model.addAttribute("tour", tour);
			
			String string = vo.getConcertDate().substring(0, 8);
			SimpleDateFormat formatter = new SimpleDateFormat("yy.MM.dd");
			Date date = formatter.parse(string);
			model.addAttribute("date", date);
			
			String time = vo.getConcertDate().substring(9);
			model.addAttribute("time", time);
			
			return "concert/updateDate";
			
		} else {
//			rttr.addFlashAttribute("msg", 5);
//			return "redirect:view.do?no="+no;
			model.addAttribute("msg", 1);
			return "concert/updateDate";
		}
	}
	
	@PostMapping("/updateDate.sub")
	public String updateDate(String date, String time, ConcertVO vo) {
		
		vo.setConcertDate(date + " " + time);
		if(vo.getLocal() == null) {
			vo.setLocal("");
		}
		
		service.updateDate(vo);
		
//		if(result == 1) {
//			rttr.addFlashAttribute("msg", 3);
//		} else {
//			rttr.addFlashAttribute("msg", 4);
//		}
		return "redirect:rest.sub";
	}
	
	@RequestMapping("/deleteDate.do")
	public String deleteDate(long dno, long no, String search, PageObject pageObject, RedirectAttributes rttr) throws UnsupportedEncodingException {
		
		List<Boolean> booleans = new ArrayList<Boolean>();
		booleans = service.check2(dno);
		
		if(booleans.size() == 0 || booleans.contains("false")) {
			service.deleteDate(dno);
			rttr.addFlashAttribute("msg", 8);
		} else {
			rttr.addFlashAttribute("msg", 9);
		}
		
		String url = URLEncoder.encode(search, "UTF-8");
		return "redirect:view.do?no="+no+"&search="+url+"&page="+pageObject.getPage()+"&perPageNum="+pageObject.getPerPageNum();
	}
	
}
