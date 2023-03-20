package com.project.movie.board.service;

import java.util.List;
import java.util.Map;

import com.project.movie.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> noticeList() throws Exception;

	public List<BoardVO> eventList() throws Exception;

	public Map reviewList(Map pagingMap) throws Exception;

	public List<BoardVO> selectReviewList(String member_id) throws Exception;

	public BoardVO noticeView(int noticeBoardNO) throws Exception;

	public Map eventView(int eventBoardNO) throws Exception;

	public Map reviewView(int reviewBoardNO) throws Exception;

	public int addReview(Map boardMap) throws Exception;

	public void boardPush(int reviewBoardNO) throws Exception;

	public void boardView(int reviewBoardNO) throws Exception;

	public void delete(int boardNO) throws Exception;

	public void deleteNotice(int boardNO) throws Exception;

	public void deleteEvent(int boardNO) throws Exception;

	public List deleteImage(int boardNO) throws Exception;

	public List deleteImageEvent(int boardNO) throws Exception;

	public int addEvent(Map boardMap) throws Exception;

	public int addNotice(Map boardMap) throws Exception;
}
