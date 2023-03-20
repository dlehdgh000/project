package com.project.movie.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.movie.admin.dao.AdminDAO;
import com.project.movie.movie.vo.ImageFileVO;
import com.project.movie.movie.vo.MovieVO;

@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;

	@Override
	public int addNewMovie(Map addMovieMap) throws Exception {
		int movie_id = adminDAO.movieInsert(addMovieMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList) addMovieMap.get("imageFileList");
		for (ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setMovie_id(movie_id);
		}
		adminDAO.insertMovieImageFile(imageFileList);
		return movie_id;
	}

	@Override
	public List<MovieVO> movieManageList() throws Exception {
		List<MovieVO> movieManageList = adminDAO.movieManageList();
		return movieManageList;
	}

	@Override
	public void deleteMovie(int movie_id) throws Exception {
		adminDAO.deleteMovie(movie_id);
	}

	@Override
	public List deleteMovieImage(int movie_id) throws Exception {
		List<ImageFileVO> deleteImageList = adminDAO.deleteMovieImage(movie_id);
		adminDAO.deleteMovieImageDB(movie_id);
		return deleteImageList;
	}

	@Override
	public void modifyMovieInfo(Map movieMap) throws Exception {
		adminDAO.updateMovieInfo(movieMap);

	}

	@Override
	public void allModifyMovie(Map modMovieMap) throws Exception {
		adminDAO.allModifyMovie(modMovieMap);
	}

	@Override
	public List selectMovieImageFileList(int movie_id) throws Exception {
		List imageList = adminDAO.selectMovieImageFileList(movie_id);
		return imageList;
	}

	@Override
	public void modifyMovieImage(List<ImageFileVO> imageFileList) throws Exception {
		adminDAO.updateMovieImage(imageFileList);
	}

	@Override
	public void modifySeat(Map movieMap) throws Exception {
		String movie_place = (String) movieMap.get("movie_place");

		if (movie_place.equals("1包")) {
			adminDAO.updateSeat(movieMap);
		} else if (movie_place.equals("2包")) {
			adminDAO.updateSeat1(movieMap);
		} else if (movie_place.equals("3包")) {
			adminDAO.updateSeat2(movieMap);
		}

	}

	@Override
	public void modifySeat1(Map movieMap) throws Exception {
		String movie_place = (String) movieMap.get("movie_place");

		if (movie_place.equals("1包")) {
			adminDAO.updateSeatN(movieMap);
		} else if (movie_place.equals("2包")) {
			adminDAO.updateSeatN1(movieMap);
		} else if (movie_place.equals("3包")) {
			adminDAO.updateSeatN2(movieMap);
		}

	}
}
