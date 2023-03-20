package com.project.movie.movie.service;

import java.util.List;
import java.util.Map;

import com.project.movie.movie.vo.MovieVO;

public interface MovieService {

	public List<MovieVO> movieDetail(int movie_id) throws Exception;

	public List<MovieVO> searchMovie(String movie_keyword) throws Exception;

	public List<String> keywordSearch(String keyword) throws Exception;
	
	public void oneLineReview(Map reviewMap) throws Exception;
	
	public List<MovieVO> oneLineReviewList(int movie_id) throws Exception;
}
