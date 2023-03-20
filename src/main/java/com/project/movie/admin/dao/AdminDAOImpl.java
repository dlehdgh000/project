package com.project.movie.admin.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.movie.movie.vo.ImageFileVO;
import com.project.movie.movie.vo.MovieVO;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public void insertMovieImageFile(List fileList) throws DataAccessException {
		for (int i = 0; i < fileList.size(); i++) {
			ImageFileVO imageFileVO = (ImageFileVO) fileList.get(i);
			sqlSession.insert("mapper.admin.insertMovieImageFile", imageFileVO);
		}

	}

	@Override
	public int movieInsert(Map addMovieMap) throws DataAccessException {
		int movie_id = NewMovieId();
		System.out.println("movie_id :" + movie_id);
		addMovieMap.put("movie_id", movie_id);
		sqlSession.insert("mapper.admin.movieInsert", addMovieMap);
		return movie_id;
	}

	private int NewMovieId() throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.NewMovieId");
	}

	@Override
	public List<MovieVO> movieManageList() throws DataAccessException {
		List<MovieVO> movieManageList = sqlSession.selectList("mapper.admin.movieManageList");
		return movieManageList;
	}

	@Override
	public void deleteMovie(int movie_id) throws DataAccessException {
		sqlSession.delete("mapper.admin.deleteMovie", movie_id);
	}

	@Override
	public List deleteMovieImage(int movie_id) throws DataAccessException {
		List<ImageFileVO> deleteImageList = sqlSession.selectList("mapper.admin.deleteMovieImage", movie_id);
		return deleteImageList;
	}

	@Override
	public void deleteMovieImageDB(int movie_id) throws DataAccessException {
		sqlSession.delete("mapper.admin.deleteMovieImageDB", movie_id);
	}

	@Override
	public void updateMovieInfo(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateMovieInfo", movieMap);
	}

	@Override
	public void allModifyMovie(Map modMovieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.allModifyMovie", modMovieMap);
	}

	@Override
	public List selectMovieImageFileList(int movie_id) throws DataAccessException {
		List imageList = new ArrayList();
		imageList = (List) sqlSession.selectList("mapper.admin.selectMovieImageFileList", movie_id);
		return imageList;
	}

	@Override
	public void updateMovieImage(List<ImageFileVO> imageFileList) throws DataAccessException {
		for (int i = 0; i < imageFileList.size(); i++) {
			ImageFileVO imageFileVO = imageFileList.get(i);
			sqlSession.update("mapper.admin.updateMovieImage", imageFileVO);
		}
	}

	@Override
	public void updateSeat(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateSeat", movieMap);
	}

	@Override
	public void updateSeat1(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateSeat1", movieMap);
	}

	@Override
	public void updateSeat2(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateSeat2", movieMap);
	}

	@Override
	public void updateSeatN(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateSeatN", movieMap);
	}

	@Override
	public void updateSeatN1(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateSeatN1", movieMap);
	}

	@Override
	public void updateSeatN2(Map movieMap) throws DataAccessException {
		sqlSession.update("mapper.admin.updateSeatN2", movieMap);
	}

}
