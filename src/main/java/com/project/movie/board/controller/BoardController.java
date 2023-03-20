package com.project.movie.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {

	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView noticeView(@RequestParam("noticeBoardNO") int noticeBoardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView eventView(@RequestParam("eventBoardNO") int eventBoardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ModelAndView reviewView(@RequestParam("reviewBoardNO") int reviewBoardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity addReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ResponseEntity boardPush(@RequestParam("reviewBoardNO") int reviewBoardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity delete(@RequestParam("boardNO") int boardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity addEvent(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ResponseEntity addNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
