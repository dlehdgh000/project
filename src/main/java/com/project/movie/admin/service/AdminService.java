package com.project.movie.admin.service;

import java.util.List;
import java.util.Map;

import com.project.movie.movie.vo.ImageFileVO;
import com.project.movie.movie.vo.MovieVO;

public interface AdminService {

	public int addNewMovie(Map addMovieMap) throws Exception;

	public List<MovieVO> movieManageList() throws Exception;

	public void deleteMovie(int movie_id) throws Exception;

	public List deleteMovieImage(int movie_id) throws Exception;

	public void modifyMovieInfo(Map movieMap) throws Exception;

	public void allModifyMovie(Map modMovieMap) throws Exception;

	public List selectMovieImageFileList(int movie_id) throws Exception;

	public void modifyMovieImage(List<ImageFileVO> imageFileList) throws Exception;

	public void modifySeat(Map movieMap) throws Exception;

	public void modifySeat1(Map movieMap) throws Exception;
}
