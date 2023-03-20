package com.project.movie.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminController {

	public ModelAndView seatManage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity addMovie(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView movieManage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView movieModify(@RequestParam("movie_id") int movie_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity deleteMovie(@RequestParam("movie_id") int movie_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity modifyGoodsInfo(@RequestParam("movie_id") String movie_id,
			@RequestParam("mod_type") String mod_type, @RequestParam("value") String value, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity allModifyMovie(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView boardListManage(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
