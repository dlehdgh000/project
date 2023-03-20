package com.project.movie.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MypageController {

//	硫붿씤 留덉씠�럹�씠吏� (�셿)
	public ModelAndView main(@RequestParam(required = false, value = "message") String message,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

//  �삁留ㅻ궡�뿭 �긽�꽭蹂닿린	
	public ModelAndView myOrderDetail(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

//  �삁留ㅼ랬�냼
	public ModelAndView cancelMyOrder(@RequestParam("order_id") String order_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

//  �떆�옉 �궇吏� ~ �걹�궇 �궇吏� �삁留ㅻ궡�뿭 蹂닿린
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

//  �궡 �젙蹂� �긽�꽭蹂닿린
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;

//  �궡 �젙蹂� �닔�젙�븯湲�	
	public ResponseEntity modifyMyInfo(@RequestParam("attribute") String attribute, @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}