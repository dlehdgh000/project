package com.project.movie.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.movie.board.vo.BoardVO;

public interface BoardDAO {

	public List<BoardVO> noticeboardList() throws DataAccessException;

	public List<BoardVO> eventboardList() throws DataAccessException;

	public List<BoardVO> reviewboardList(Map pagingMap) throws DataAccessException;

	public List<BoardVO> selectReviewList(String member_id) throws DataAccessException;

	public BoardVO noticeView(int noticeBoardNO) throws DataAccessException;

	public BoardVO eventView(int eventBoardNO) throws DataAccessException;

	public BoardVO reviewView(int reviewBoardNO) throws DataAccessException;

	public int addReview(Map boardMap) throws DataAccessException;

	public void boardPush(int reviewBoardNO) throws DataAccessException;

	public void boardView(int reviewBoardNO) throws DataAccessException;

	public void insertReviewImageFile(Map boardMap) throws DataAccessException;

	public void insertEventImageFile(Map boardMap) throws DataAccessException;

	public List selectImageFileList(int boardNO) throws DataAccessException;

	public List selectImageFileList1(int boardNO) throws DataAccessException;

	public void delete(int boardNO) throws DataAccessException;

	public void deleteNotice(int boardNO) throws DataAccessException;

	public void deleteEvent(int boardNO) throws DataAccessException;

	public void deleteImageDB(int boardNO) throws DataAccessException;

	public List deleteImage(int boardNO) throws DataAccessException;

	public List deleteImageEvent(int boardNO) throws DataAccessException;

	public void deleteImageDBEvent(int boardNO) throws DataAccessException;

	public int addEvent(Map boardMap) throws DataAccessException;

	public int addNotice(Map boardMap) throws DataAccessException;

	public int selectTotalReview() throws DataAccessException;
}
