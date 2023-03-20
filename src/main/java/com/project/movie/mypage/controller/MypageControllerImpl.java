package com.project.movie.mypage.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

import com.project.movie.board.service.BoardService;
import com.project.movie.member.vo.MemberVO;
import com.project.movie.mypage.service.MyPageService;
import com.project.movie.order.service.OrderService;
import com.project.movie.order.vo.OrderVO;

@Controller("mypageController")
@RequestMapping(value = "/mypage")
public class MypageControllerImpl implements MypageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private MemberVO memberVO;

	@Autowired
	private OrderVO orderVO;

	@Autowired
	private BoardService boardService;

	@Autowired
	private OrderService orderService;

	// 메인 마이페이지
	@Override
	@RequestMapping(value = "/mypage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView main(String message, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();
		String member_id = "";
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		if (session.getAttribute("member") == null) {
//			mav.addObject("session", session.getAttribute("member"));
//			MemberVO vo = (MemberVO) session.getAttribute("member");
//			System.out.println(vo.toString());

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('濡쒓렇�씤 �썑 �씠�슜媛��뒫�빀�땲�떎.');history.back();</script>");
			out.flush();
			response.flushBuffer();
			out.close();
		} else {
			mav.addObject("session", session.getAttribute("member"));
			MemberVO vo = (MemberVO) session.getAttribute("member");
			member_id = vo.getMember_id();
			System.out.println(vo.toString());
		}

		memberVO = (MemberVO) session.getAttribute("memberInfoList");
		MemberVO memberInfo = myPageService.myDetailInfo(member_id);
		mav.addObject("memberInfo", memberInfo); // �굹�쓽 �젙蹂� �쓣�슦湲� �걹
		memberVO = (MemberVO) session.getAttribute("member");
//		String member_id2 = orderVO.getMember_id2();
		String member_id2 = memberVO.getMember_id();
		orderVO = (OrderVO) session.getAttribute("orderInfoList");
		List orderInfoList = myPageService.findMyOrderInfo(member_id2);

		List selectReviewList = boardService.selectReviewList(member_id2);

		mav.addObject("reviewInfoList", selectReviewList);
		mav.addObject("orderInfoList", orderInfoList);

//		String id = reviewVO.getId();
//		String id = "";
//		reviewVO=(ReviewVO)session.getAttribute("reviewInfoList");
//		List reviewInfoList = myPageService.myDetailreview(id);
//		mav.addObject("reviewInfoList", reviewInfoList);
//		
		mav.setViewName(viewName);

		return mav;
	}

//	내 예매내역
	@Override
	@RequestMapping(value = "/myOrderDetail.do", method = RequestMethod.GET)
	public ModelAndView myOrderDetail(String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

//		member_id = orderVO.getMember_id();
		memberVO = (MemberVO) session.getAttribute("member");
		member_id = memberVO.getMember_id();
		orderVO = (OrderVO) session.getAttribute("orderInfoList");
		List orderInfoList = orderService.selectMyOrderDetailInfo(member_id);
		mav.addObject("orderInfoList", orderInfoList);

		return mav;
	}

// 예매취소
	@Override
	public ModelAndView cancelMyOrder(String order_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

// �궇吏쒕퀎 �삁留� �궡�뿭 �솗�씤
	@Override
	public ModelAndView listMyOrderHistory(Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

// 	내정보 자세히 보기
	@Override
	@RequestMapping(value = "/myDetailInfo.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}

// 수정하기
	@Override
	@RequestMapping(value = "/modifyMyInfo.do", method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute") String attribute, @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String> memberMap = new HashMap<String, String>();
		String val[] = null;
		System.out.println("value" + value);
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		String member_id = memberVO.getMember_id();
		System.out.println("member_id=" + memberVO.getMember_id());

		if (attribute.equals("member_pw")) {
			val = value.split("");
			memberMap.put("member_pw", value);

		} else if (attribute.equals("member_hp")) {
			val = value.split(",");
			memberMap.put("member_hp1", val[0]);
			memberMap.put("member_hp2", val[1]);
			memberMap.put("member_hp3", val[2]);
		} else {
			memberMap.put(attribute, value);
		}

		memberMap.put("member_id", member_id);

		System.out.println("memberMap.toString()" + memberMap.toString());
		// ������ ȸ�� ������ �ٽ� ���ǿ� �����Ѵ�.
		memberVO = (MemberVO) myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("member");
		session.setAttribute("member", memberVO);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}