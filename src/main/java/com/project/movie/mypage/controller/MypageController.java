package com.project.movie.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MypageController {

//	마이페이지 메인
	public ModelAndView main(@RequestParam(required = false, value = "message") String message,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

//  내 예매 내역 자세히 보기	
	public ModelAndView myOrderDetail(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;


//  내 정보 자세히 보기
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;

//  내 정보 수정하기	
	public ResponseEntity modifyMyInfo(@RequestParam("attribute") String attribute, @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}