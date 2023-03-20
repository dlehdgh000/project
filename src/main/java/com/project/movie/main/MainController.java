package com.project.movie.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.movie.board.service.BoardService;
import com.project.movie.member.vo.MemberVO;
import com.project.movie.order.service.OrderService;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/main/main.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List titleList = orderService.MovieTitleList();
		List titleList1 = orderService.MovieTitleList1();
		List noticeList = boardService.noticeList();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
		mav.addObject("titleList", titleList);
		mav.addObject("titleList1", titleList1);
		mav.addObject("noticeList", noticeList);

		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("member"));
		if (session.getAttribute("member") != null) {
			mav.addObject("session", session.getAttribute("member"));
			MemberVO vo = (MemberVO) session.getAttribute("member");
			System.out.println(vo.toString());
		}

		return mav;
	}
}
