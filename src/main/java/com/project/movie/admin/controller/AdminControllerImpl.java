package com.project.movie.admin.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.movie.admin.service.AdminService;
import com.project.movie.board.service.BoardService;
import com.project.movie.common.base.BaseController;
import com.project.movie.member.vo.MemberVO;
import com.project.movie.movie.service.MovieService;
import com.project.movie.movie.vo.ImageFileVO;
import com.project.movie.order.service.OrderService;

@Controller("adminController")
@RequestMapping(value = "/admin")
public class AdminControllerImpl extends BaseController implements AdminController {

	private static final String CURR_IMAGE_REPO_PATH = "C:\\movie\\file_repo";

	@Autowired
	private AdminService adminService;

	@Autowired
	private MovieService movieService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private BoardService boardService;

	@Override
	@RequestMapping(value = "/seatManage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView seatManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		List seatList = orderService.selectSeatList(); // 1관
		List seatList1 = orderService.selectSeatList1(); // 2관
		List seatList2 = orderService.selectSeatList2(); // 3관

		mav.addObject("seatList", seatList);
		mav.addObject("seatList1", seatList1);
		mav.addObject("seatList2", seatList2);

		return mav;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/addMovie.do", method = RequestMethod.POST)
	public ResponseEntity addMovie(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String fileName = null;
		Map addMovieMap = new HashMap();

		Enumeration enu = multipartRequest.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			addMovieMap.put(name, value);
			System.out.println("name :" + name);
			System.out.println("value :" + value);
		}

		String movie_openday1 = (String) addMovieMap.get("movie_openday1");
		String movie_openday2 = (String) addMovieMap.get("movie_openday2");
		String movie_openday3 = (String) addMovieMap.get("movie_openday3");
		String movie_openday = movie_openday1 + "/" + movie_openday2 + "/" + movie_openday3;
		addMovieMap.remove(movie_openday1);
		addMovieMap.remove(movie_openday2);
		addMovieMap.remove(movie_openday3);
		addMovieMap.put("movie_openday", movie_openday);
		System.out.println("movie_openday :" + movie_openday);

		HttpSession session = multipartRequest.getSession();

		List<ImageFileVO> imageFileList = upload(multipartRequest);
		addMovieMap.put("imageFileList", imageFileList);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int movie_id = adminService.addNewMovie(addMovieMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + movie_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
			message = "<script>";
			message += " alert('영화 등록이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/insertMovie.do';";
			message += "</script>";
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fileName);
					srcFile.delete();
				}
			}

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/admin/insertMovie.do';";
			message += "</script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/movieManage.do", method = RequestMethod.GET)
	public ModelAndView movieManage(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List movieManageList = adminService.movieManageList();
		mav.setViewName(viewName);
		mav.addObject("movieManageList", movieManageList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/movieModify.do", method = RequestMethod.GET)
	public ModelAndView movieModify(@RequestParam("movie_id") int movie_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map movieMap = new HashMap();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		List movieModifyList = movieService.movieDetail(movie_id);
		List imageFileList = adminService.selectMovieImageFileList(movie_id);
		movieMap.put("movieModifyList", movieModifyList);
		movieMap.put("imageFileList", imageFileList);
		mav.addObject("movieMap", movieMap);
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/deleteMovie.do", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity deleteMovie(@RequestParam("movie_id") int movie_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=utf-8");

		String message;
		String fileName;
		ResponseEntity resEnt = null;

		HttpHeaders responseHeaders = new HttpHeaders();

		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {

			adminService.deleteMovie(movie_id);
			List<ImageFileVO> deleteImageList = adminService.deleteMovieImage(movie_id);

			if (deleteImageList != null && deleteImageList.size() != 0) {
				for (ImageFileVO imageFileVO : deleteImageList) {
					fileName = imageFileVO.getFileName();
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + movie_id + "\\" + fileName);
					destDir.delete();
				}

			}

			message = "<script>";
			message += " alert('영화를 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/movieManage.do';";
			message += " </script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/admin/movieManage.do';";
			message += " </script>";

			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/modifyMovieInfo.do", method = { RequestMethod.POST })
	public ResponseEntity modifyGoodsInfo(@RequestParam("movie_id") String movie_id,
			@RequestParam("attribute") String attribute, @RequestParam("value") String value,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("modifyGoodsInfo");

		Map<String, String> movieMap = new HashMap<String, String>();
		movieMap.put("movie_id", movie_id);
		movieMap.put(attribute, value);
		adminService.modifyMovieInfo(movieMap);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/allModifyMovie.do", method = RequestMethod.POST)
	public ResponseEntity allModifyMovie(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		Map modMovieMap = new HashMap();

		Enumeration enu = request.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			modMovieMap.put(name, value);
			System.out.println("name :" + name);
			System.out.println("value :" + value);
		}
		String movie_id1 = (String) modMovieMap.get("movie_id");
		int movie_id = Integer.parseInt(movie_id1);
		String movie_openday1 = (String) modMovieMap.get("movie_openday1");
		String movie_openday2 = (String) modMovieMap.get("movie_openday2");
		String movie_openday3 = (String) modMovieMap.get("movie_openday3");
		String movie_openday = movie_openday1 + "/" + movie_openday2 + "/" + movie_openday3;
		modMovieMap.remove(movie_openday1);
		modMovieMap.remove(movie_openday2);
		modMovieMap.remove(movie_openday3);
		modMovieMap.put("movie_openday", movie_openday);
		System.out.println("movie_openday :" + movie_openday);

		String message = null;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		try {

			adminService.allModifyMovie(modMovieMap);

			message = "<script>";
			message += " alert('영화 수정이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/admin/movieManage.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {

			message = "<script>";
			message += " alert('오류가 발생했습니다 다시 시도해주세요.');";
			message += " location.href='" + request.getContextPath() + "/admin/movieManage.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/modifyMovieImageInfo.do", method = { RequestMethod.POST })
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		System.out.println("modifyMovieImageInfo");
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String imageFileName = null;

		Map goodsMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			goodsMap.put(name, value);
		}

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getMember_id();

		List<ImageFileVO> imageFileList = null;
		int movie_id = 0;
		int image_id = 0;
		try {
			imageFileList = upload(multipartRequest);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					movie_id = Integer.parseInt((String) goodsMap.get("movie_id"));
					image_id = Integer.parseInt((String) goodsMap.get("image_id"));
					imageFileVO.setMovie_id(movie_id);
					imageFileVO.setImage_id(image_id);
					imageFileVO.setReg_id(reg_id);
				}

				adminService.modifyMovieImage(imageFileList);
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + movie_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}
		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (ImageFileVO imageFileVO : imageFileList) {
					imageFileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/modifySeat.do", method = { RequestMethod.POST })
	public ResponseEntity modifySeat(@RequestParam("movie_place") String movie_place, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// System.out.println("modifyGoodsInfo");
		System.out.println("movie_place" + movie_place);
		Map<String, String> movieMap = new HashMap<String, String>();
		movieMap.put("movie_place", movie_place);
		adminService.modifySeat(movieMap);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/modifySeat1.do", method = { RequestMethod.POST })
	public ResponseEntity modifySeat1(@RequestParam("movie_place") String movie_place, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// System.out.println("modifyGoodsInfo");
		System.out.println("movie_place" + movie_place);
		Map<String, String> movieMap = new HashMap<String, String>();
		movieMap.put("movie_place", movie_place);
		adminService.modifySeat1(movieMap);

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "mod_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/boardListManage.do", method = RequestMethod.GET)
	public ModelAndView boardListManage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		mav.setViewName(viewName);
//		Map reviewList = boardService.reviewList();
		List eventList = boardService.eventList();
		List noticeList = boardService.noticeList();
//		mav.addObject("reviewList", reviewList);
		mav.addObject("eventList", eventList);
		mav.addObject("noticeList", noticeList);
		return mav;
	}

	@RequestMapping(value = "/deleteBoard.do", method = RequestMethod.GET)
	public ResponseEntity deleteBoard(@RequestParam("boardNO") int boardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// System.out.println("modifyGoodsInfo");
		System.out.println("boardNO" + boardNO);
		Map<String, String> movieMap = new HashMap<String, String>();
		boardService.deleteNotice(boardNO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "delete_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/deleteBoard1.do", method = RequestMethod.GET)
	public ResponseEntity deleteBoard1(@RequestParam("boardNO") int boardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// System.out.println("modifyGoodsInfo");
		System.out.println("boardNO" + boardNO);
		Map<String, String> movieMap = new HashMap<String, String>();
		String fileName;
		boardService.deleteEvent(boardNO);
		List<ImageFileVO> deleteImageList = boardService.deleteImageEvent(boardNO);

		if (deleteImageList != null && deleteImageList.size() != 0) {
			for (ImageFileVO imageFileVO : deleteImageList) {
				fileName = imageFileVO.getFileName();
				File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + boardNO + "\\" + fileName);
				destDir.delete();
			}

		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "delete_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@RequestMapping(value = "/deleteBoard2.do", method = RequestMethod.GET)
	public ResponseEntity deleteBoard2(@RequestParam("boardNO") int boardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// System.out.println("modifyGoodsInfo");
		System.out.println("boardNO" + boardNO);
		Map<String, String> movieMap = new HashMap<String, String>();
		boardService.delete(boardNO);
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "delete_success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
