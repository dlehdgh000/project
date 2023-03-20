package com.project.movie.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.movie.board.vo.BoardVO;
import com.project.movie.movie.vo.ImageFileVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> noticeboardList() throws DataAccessException {
		List<BoardVO> noticeList = sqlSession.selectList("mapper.board.noticeList");
		return noticeList;
	}

	@Override
	public List<BoardVO> eventboardList() throws DataAccessException {
		List<BoardVO> eventList = sqlSession.selectList("mapper.board.eventList");
		return eventList;
	}

	@Override
	public List<BoardVO> reviewboardList(Map pagingMap) throws DataAccessException {
		List<BoardVO> reviewList = sqlSession.selectList("mapper.board.reviewList",pagingMap);
		return reviewList;
	}
	
	@Override
	public int selectTotalReview() throws DataAccessException {
		int totalBoard = sqlSession.selectOne("mapper.board.selectTotalReview");
		return totalBoard;
	}

	@Override
	public BoardVO noticeView(int noticeBoardNO) throws DataAccessException {
		BoardVO boardVO = sqlSession.selectOne("mapper.board.noticeView", noticeBoardNO);
		return boardVO;
	}

	@Override
	public BoardVO eventView(int eventBoardNO) throws DataAccessException {
		BoardVO boardVO = sqlSession.selectOne("mapper.board.eventView", eventBoardNO);
		return boardVO;
	}

	@Override
	public BoardVO reviewView(int reviewBoardNO) throws DataAccessException {
		BoardVO boardVO = sqlSession.selectOne("mapper.board.reviewView", reviewBoardNO);
		return boardVO;
	}

	@Override
	public int addReview(Map boardMap) throws DataAccessException {
		int boardNO = NewBoardNO();
		System.out.println("boardNO :" + boardNO);
		boardMap.put("boardNO", boardNO);
		sqlSession.insert("mapper.board.addReview", boardMap);
		return boardNO;
	}

	private int NewBoardNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.NewBoardNO");
	}

	@Override
	public void boardPush(int reviewBoardNO) throws DataAccessException {
		sqlSession.update("mapper.board.push", reviewBoardNO);
	}

	@Override
	public void boardView(int reviewBoardNO) throws DataAccessException {
		sqlSession.update("mapper.board.viewcnt", reviewBoardNO);
	}

	@Override
	public List<BoardVO> selectReviewList(String member_id) throws DataAccessException {
		List<BoardVO> selectReviewList = sqlSession.selectList("mapper.board.selectreviewList", member_id);
		return selectReviewList;
	}

	@Override
	public void insertReviewImageFile(Map boardMap) throws DataAccessException {
		List<ImageFileVO> imageFileList = (ArrayList) boardMap.get("imageFileList");
		int boardNO = (Integer) boardMap.get("boardNO");
		int image_id = selectNewImageFileNO();
		System.out.println("image_id :" + image_id);
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setImage_id(++image_id);
				imageFileVO.setBoardNO(boardNO);
			}
			sqlSession.insert("mapper.board.insertMovieImageFile", imageFileList);
		}
	}

	@Override
	public void insertEventImageFile(Map boardMap) throws DataAccessException {
		List<ImageFileVO> imageFileList = (ArrayList) boardMap.get("imageFileList");
		int boardNO = (Integer) boardMap.get("boardNO");
		int image_id = selectNewImageFileNOEvent();
		System.out.println("image_id :" + image_id);
		if (imageFileList != null && imageFileList.size() != 0) {
			for (ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setImage_id(++image_id);
				imageFileVO.setBoardNO(boardNO);
			}
			sqlSession.insert("mapper.board.insertEventImageFile", imageFileList);
		}
	}

	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}

	private int selectNewImageFileNOEvent() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNOEvent");
	}

	@Override
	public List selectImageFileList(int boardNO) throws DataAccessException {
		List<ImageFileVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList", boardNO);
		return imageFileList;
	}

	@Override
	public List selectImageFileList1(int boardNO) throws DataAccessException {
		List<ImageFileVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList1", boardNO);
		return imageFileList;
	}

	@Override
	public void delete(int boardNO) throws DataAccessException {
		sqlSession.delete("mapper.board.delete", boardNO);
	}

	@Override
	public void deleteNotice(int boardNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteNotice", boardNO);
	}

	@Override
	public void deleteEvent(int boardNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteEvent", boardNO);
	}

	@Override
	public List deleteImage(int boardNO) throws DataAccessException {
		List<ImageFileVO> deleteImageList = sqlSession.selectList("mapper.board.deleteImage", boardNO);
		return deleteImageList;
	}

	@Override
	public void deleteImageDB(int boardNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteImageDB", boardNO);
	}

	@Override
	public List deleteImageEvent(int boardNO) throws DataAccessException {
		List<ImageFileVO> deleteImageList = sqlSession.selectList("mapper.board.deleteImageEvent", boardNO);
		return deleteImageList;
	}

	@Override
	public void deleteImageDBEvent(int boardNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteImageDBEvent", boardNO);
	}

	@Override
	public int addEvent(Map boardMap) throws DataAccessException {
		int boardNO = NewBoardNO1();
		System.out.println("boardNO :" + boardNO);
		boardMap.put("boardNO", boardNO);
		sqlSession.insert("mapper.board.addEvent", boardMap);
		return boardNO;
	}

	private int NewBoardNO1() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.NewBoardNO1");
	}

	@Override
	public int addNotice(Map boardMap) throws DataAccessException {
		int boardNO = NewBoardNO2();
		System.out.println("boardNO :" + boardNO);
		boardMap.put("boardNO", boardNO);
		sqlSession.insert("mapper.board.addNotice", boardMap);
		return boardNO;
	}

	private int NewBoardNO2() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.NewBoardNO2");
	}

}
