package com.project.movie.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {

	// 빠른 예매 화면에 나올 리스트
	public ModelAndView MovieTitleList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	// 예매
	public ResponseEntity addOrder(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
