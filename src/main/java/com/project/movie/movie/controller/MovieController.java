package com.project.movie.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface MovieController {

//	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView movieDetail(@RequestParam("movie_id") int movie_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView searchMovie(@RequestParam("movie_keyword") String movie_keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
