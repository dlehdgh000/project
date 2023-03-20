package com.project.movie.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.movie.movie.service.MovieService;
import com.project.movie.movie.vo.MovieVO;

import net.sf.json.JSONObject;

@Controller("movieController")
@RequestMapping(value = "/movie")
@EnableAspectJAutoProxy
public class MovieControllerImpl implements MovieController {

	// 의존성 주입
	@Autowired
	private MovieService movieService;
	@Autowired
	private MovieVO movieVO;

	// 메인 요청 컨트롤러
//	@Override
//	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
//	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
//		ModelAndView mav=new ModelAndView();
//		String viewName=(String)request.getAttribute("viewName");
//		mav.setViewName(viewName);
//		return mav;
//	}

	// 무비 디테일(상세페이지)로 가는 컨트롤러
	@Override
	@RequestMapping(value = "/movieDetail.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView movieDetail(@RequestParam("movie_id") int movie_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List movieList = movieService.movieDetail(movie_id);
		List oneLineReviewList = movieService.oneLineReviewList(movie_id);
		mav.addObject("oneLineReviewList",oneLineReviewList);
		mav.addObject("movieList", movieList);
		System.out.println("movieList: " + movieList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/searchMovie.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView searchMovie(@RequestParam("movie_keyword") String movie_keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		System.out.println("movie_title: " + movie_keyword);
		List<MovieVO> searchList = movieService.searchMovie(movie_keyword);
		int Listsize = searchList.size();
		mav.addObject("movie_keyword", movie_keyword);
		mav.addObject("searchList", searchList);
		mav.addObject("ListSize", Listsize);
		System.out.println("searchList: " + searchList);

		return mav;
	}

	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println(keyword);
		if (keyword == null || keyword.equals(""))
			return null;

		keyword = keyword.toUpperCase();
		List<String> keywordList = movieService.keywordSearch(keyword);

		// 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);

		String jsonInfo = jsonObject.toString();
		System.out.println(jsonInfo);
		return jsonInfo;
	}
	
	@RequestMapping(value = "/oneLineReview.do", method = RequestMethod.POST)
	public ResponseEntity oneLineReview(@RequestParam("movie_id") String movie_id,
										@RequestParam("id") String id,
										@RequestParam("content") String content,
										HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,String> reviewMap = new HashMap<String,String>();
		reviewMap.put("movie_id", movie_id);
		reviewMap.put("id", id);
		reviewMap.put("content", content);
		movieService.oneLineReview(reviewMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message = "success";
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
