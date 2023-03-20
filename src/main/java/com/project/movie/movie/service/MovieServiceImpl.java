package com.project.movie.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.movie.dao.MovieDAO;
import com.project.movie.movie.vo.MovieVO;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDAO movieDAO;

	@Override
	public List<MovieVO> movieDetail(int movie_id) throws Exception {
		List<MovieVO> movieList = movieDAO.viewMovieDetail(movie_id);
		return movieList;
	}

	@Override
	public List<MovieVO> searchMovie(String movie_keyword) throws Exception {
		List<MovieVO> searchList = movieDAO.searchMovie(movie_keyword);
		return searchList;
	}

	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list = movieDAO.selectKeywordSearch(keyword);
		return list;
	}

	@Override
	public void oneLineReview(Map reviewMap) throws Exception {
		movieDAO.addOneLineReview(reviewMap);
	}

	@Override
	public List<MovieVO> oneLineReviewList(int movie_id) throws Exception {
		List<MovieVO> oneLineReviewList = movieDAO.oneLineReviewList(movie_id);
		return oneLineReviewList;
	}

}
