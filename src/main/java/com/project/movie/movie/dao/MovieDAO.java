package com.project.movie.movie.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.movie.movie.vo.MovieVO;

public interface MovieDAO {

	public List<MovieVO> viewMovieDetail(int movie_id) throws DataAccessException;

	public List<MovieVO> searchMovie(String movie_keyword) throws DataAccessException;

	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;

	public void addOneLineReview(Map reviewMap) throws DataAccessException;
	
	public List<MovieVO> oneLineReviewList(int movie_id) throws DataAccessException;
}
