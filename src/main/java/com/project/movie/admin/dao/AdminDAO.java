package com.project.movie.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.movie.movie.vo.ImageFileVO;
import com.project.movie.movie.vo.MovieVO;

public interface AdminDAO {

	public void insertMovieImageFile(List fileList) throws DataAccessException;

	public int movieInsert(Map addMovieMap) throws DataAccessException;

	public List<MovieVO> movieManageList() throws DataAccessException;

	public void deleteMovie(int movie_id) throws DataAccessException;

	public void deleteMovieImageDB(int movie_id) throws DataAccessException;

	public List deleteMovieImage(int movie_id) throws DataAccessException;

	public void updateMovieInfo(Map movieMap) throws DataAccessException;

	public void allModifyMovie(Map modMovieMap) throws DataAccessException;

	public List selectMovieImageFileList(int movie_id) throws DataAccessException;

	public void updateMovieImage(List<ImageFileVO> imageFileList) throws DataAccessException;

	public void updateSeat(Map movieMap) throws DataAccessException;

	public void updateSeat1(Map movieMap) throws DataAccessException;

	public void updateSeat2(Map movieMap) throws DataAccessException;

	public void updateSeatN(Map movieMap) throws DataAccessException;

	public void updateSeatN1(Map movieMap) throws DataAccessException;

	public void updateSeatN2(Map movieMap) throws DataAccessException;

}
