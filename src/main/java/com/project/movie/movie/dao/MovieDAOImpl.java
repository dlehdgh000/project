package com.project.movie.movie.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.movie.movie.vo.MovieVO;

@Repository("movieDAO")
public class MovieDAOImpl implements MovieDAO {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public List<MovieVO> viewMovieDetail(int movie_id) throws DataAccessException {
		List<MovieVO> movieList = sqlsession.selectList("mapper.movie.selectMovieDetail", movie_id);
		return movieList;
	}

	@Override
	public List<MovieVO> searchMovie(String movie_keyword) throws DataAccessException {
		List<MovieVO> searchList = sqlsession.selectList("mapper.movie.searchMovie", movie_keyword);
		return searchList;
	}

	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
		List<String> list = (ArrayList) sqlsession.selectList("mapper.movie.selectKeywordSearch", keyword);
		return list;
	}

	@Override
	public void addOneLineReview(Map reviewMap) throws DataAccessException {
		int ONELINEREVIEWNO = NewOneLineReviewNO();
		reviewMap.put("oneLineReviewNO", ONELINEREVIEWNO);
		sqlsession.insert("mapper.movie.addOneLineReview",reviewMap);
		
	}

	private int NewOneLineReviewNO() {
		return sqlsession.selectOne("mapper.movie.NewOneLineReviewNO");
	}

	@Override
	public List<MovieVO> oneLineReviewList(int movie_id) throws DataAccessException {
		List<MovieVO> oneLineReviewList = sqlsession.selectList("mapper.movie.oneLineReviewList",movie_id);
		return oneLineReviewList;
	}

}
