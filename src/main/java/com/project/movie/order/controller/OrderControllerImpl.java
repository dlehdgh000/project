package com.project.movie.order.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.movie.member.vo.MemberVO;
import com.project.movie.order.service.OrderService;
import com.project.movie.order.vo.OrderVO;
import com.project.movie.util.SmsService;

@Controller("orderController")
@RequestMapping(value = "/order") // 예매하기
public class OrderControllerImpl implements OrderController {

	//의존성
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderVO orderVO;

	@Autowired
	private MemberVO memberVO;

	// 빠른예매
	@Override
	@RequestMapping(value = "/ticketing.do", method = { RequestMethod.POST, RequestMethod.GET }) // 占쌨쇽옙占쏙옙 占쏙옙占쏙옙
																									// 占쏙옙占쏙옙
	public ModelAndView MovieTitleList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List titleList = orderService.MovieTitleList(); // 상영중인 영화 목록
		List titleList1 = orderService.MovieTitleList1(); // 상영 예정작 목록
		String viewName = (String) request.getAttribute("viewName"); // 현재 페이지 이름
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("titleList", titleList); 
		mav.addObject("titleList1", titleList1); 
		return mav;
	}
// 좌석 선택
	@RequestMapping(value = "/seatselect.do", method = RequestMethod.POST)
	private ModelAndView seatSelect(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			session.setAttribute(name, value);
			// 세션 값 확인
			System.out.println("name :" + name);
			System.out.println("value :" + value);
		}
		String movie_place = (String) session.getAttribute("movie_place"); // 세션 유지 될 동안 상영관 넣어줌
		List seatList = orderService.selectSeatList(); // 1관
		List seatList1 = orderService.selectSeatList1(); // 2관
		List seatList2 = orderService.selectSeatList2(); // 3관
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("seatList", seatList);
		mav.addObject("seatList1", seatList1);
		mav.addObject("seatList2", seatList2);
		mav.addObject("movie_place", movie_place);
		return mav;

	}
//	예매하기
	@RequestMapping(value = "/ticketingForm.do", method = RequestMethod.POST)
	private ModelAndView ticketingForm(@RequestParam("seatNum") int seatNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		System.out.println("ticketingForm.do :" + seatNum); // 선택한 좌석
		session.setAttribute("seatNum", seatNum);
		String member_id = (String) session.getAttribute("member_id");
		String movie_place = (String) session.getAttribute("movie_place"); // 상영 장소 (ex : 1관,2관....)
		String movieTitle = (String) session.getAttribute("movieTitle"); // 영화 이름
		String movie_screening_date = (String) session.getAttribute("movie_screening_date"); // 상영 날짜
		String movie_running_time = (String) session.getAttribute("movie_running_time"); // 상영 시작 시간
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("movieTitle", movieTitle);
		mav.addObject("seatNum", seatNum);
		mav.addObject("movie_place", movie_place);
		mav.addObject("movie_screening_date", movie_screening_date);
		mav.addObject("movie_running_time", movie_running_time);
		mav.addObject("member_id", member_id);

		return mav;

	}
	
//	영화 선택 
	@RequestMapping(value = "/timeselect.do", method = RequestMethod.POST)
	private ModelAndView timeSelect(@RequestParam("movieNum") int movieNum,
			@RequestParam("movieTitle") String movieTitle, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		System.out.println("timeselect.do : " + movieNum);
		System.out.println("timeselect.do : " + movieTitle);
		session.setAttribute("movieNum", movieNum);
		session.setAttribute("movieTitle", movieTitle);
		ModelAndView mav = new ModelAndView(viewName);
		return mav;

	}

	@Override
	@RequestMapping(value = "addOrder.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map orderMap = new HashMap();

		Enumeration enu = request.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			orderMap.put(name, value);
			
			System.out.println("name :" + name);
			System.out.println("value :" + value);

		}

		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getMember_id();
		System.out.println("member_id:" + member_id);
		orderMap.put("member_id", member_id);

		String movie_people_qty1 = (String) orderMap.get("movie_people_qty");
		int movie_people_qty = Integer.parseInt(movie_people_qty1);
		orderMap.remove("movie_people_qty");
		orderMap.put("movie_people_qty", movie_people_qty);

		String movie_price1 = (String) orderMap.get("movie_price");
		int movie_price = Integer.parseInt(movie_price1);
		orderMap.remove("movie_price");
		orderMap.put("movie_price", movie_price);

		// orderMap에 폰 번호 하나로 넣기
		String hpNum1 = (String) orderMap.get("hpNum1");
		String hpNum2 = (String) orderMap.get("hpNum2");
		String hpNum3 = (String) orderMap.get("hpNum3");
		orderMap.remove("hpNum1");
		orderMap.remove("hpNum2");
		orderMap.remove("hpNum3");
		String hp_num = hpNum1 + hpNum2 + hpNum3;
		String pay_orderer_hp_num = hpNum1 + "-" + hpNum2 + "-" + hpNum3;
		orderMap.put("pay_orderer_hp_num", pay_orderer_hp_num);

		String cardNum1 = (String) orderMap.get("cardNum1");
		String cardNum2 = (String) orderMap.get("cardNum2");
		String cardNum3 = (String) orderMap.get("cardNum3");
		String cardNum4 = (String) orderMap.get("cardNum4");
		orderMap.remove("cardNum1");
		orderMap.remove("cardNum2");
		orderMap.remove("cardNum3");
		orderMap.remove("cardNum4");
		String card_number = cardNum1 + "-" + cardNum2 + "-" + cardNum3 + "-" + cardNum4;
		orderMap.put("card_number", card_number);

		String cardYear = (String) orderMap.get("cardYear");
		String cardMonth = (String) orderMap.get("cardMonth");
		orderMap.remove("cardYear");
		orderMap.remove("cardMonth");

		String card_pay_month = cardYear + "/" + cardMonth;
		orderMap.put("card_pay_month", card_pay_month);

		int movieNum = (int) session.getAttribute("movieNum");

		System.out.println("movieNum :" + movieNum);
		orderMap.put("movie_id", movieNum);
		session.removeAttribute("movieNum");
		session.removeAttribute("movie_screening_date");
		session.removeAttribute("movie_running_time");
		session.removeAttribute("movie_place");

		// 티켓 번호 랜덤 생성
		Random random = new Random();
		int ticket_number = random.nextInt(999999);
		orderMap.put("ticket_number", ticket_number);

		// 값 확인
		System.out.println("pay_orderer_hp_num :" + pay_orderer_hp_num);
		System.out.println("card_number :" + card_number);
		System.out.println("card_pay_month :" + card_pay_month);
		System.out.println("ticket_number :" + ticket_number);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			orderService.addOrder(orderMap);

			message = "<script>";
			message += " alert('예매에 성공했습니다.');";
			message += " location.href='" + request.getContextPath() + "/mypage/mypage.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += " location.href='" + request.getContextPath() + "/order/ticketing.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		String movie_title = (String)orderMap.get("movie_title");
		String movie_running_time = (String)orderMap.get("movie_running_time");
		String movie_place = (String)orderMap.get("movie_place");
		String movie_seat_number = (String)orderMap.get("movie_seat_number");
		
		
		System.out.println(movie_title+"\n"+ movie_running_time+"\n"+ movie_place +"\n"+ movie_seat_number +"\n 티켓 번호 :"+ticket_number);
		
//		예매 성공시 문자 전송(COOL SMS API)
//		SmsService smsService = new SmsService();
//		smsService.sendMmsByResourcePath("01033657184", hp_num,
//				movie_title+"\n"+ movie_running_time+"\n"+ movie_place +"\n"+ movie_seat_number +"\n티켓 번호 :"+ticket_number );
		
		return resEnt;
	}

}
