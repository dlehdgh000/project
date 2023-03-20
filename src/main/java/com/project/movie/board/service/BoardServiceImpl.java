package com.project.movie.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.movie.board.dao.BoardDAO;
import com.project.movie.board.vo.BoardVO;
import com.project.movie.movie.vo.ImageFileVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> noticeList() throws Exception {
		List<BoardVO> noticeList = boardDAO.noticeboardList();
		return noticeList;
	}

	@Override
	public List<BoardVO> eventList() throws Exception {
		List<BoardVO> eventList = boardDAO.eventboardList();
		return eventList;
	}

	@Override
	public Map reviewList(Map pagingMap) throws Exception {
		Map boardMap = new HashMap();
		List<BoardVO> reviewList = boardDAO.reviewboardList(pagingMap);
		int totalBoard = boardDAO.selectTotalReview();
		boardMap.put("reviewList", reviewList);
		boardMap.put("totalBoard", totalBoard);
		return boardMap;
	}

	@Override
	public BoardVO noticeView(int noticeBoardNO) throws Exception {
		BoardVO boardVO = boardDAO.noticeView(noticeBoardNO);
		return boardVO;
	}

	@Override
	public Map eventView(int eventBoardNO) throws Exception {
		Map boardMap = new HashMap();
		BoardVO boardVO = boardDAO.eventView(eventBoardNO);
		List<ImageFileVO> imageFileList = boardDAO.selectImageFileList1(eventBoardNO);
		boardMap.put("board", boardVO);
		boardMap.put("imageFileList", imageFileList);
		return boardMap;
	}

	@Override
	public Map reviewView(int reviewBoardNO) throws Exception {
		Map boardMap = new HashMap();
		BoardVO boardVO = boardDAO.reviewView(reviewBoardNO);
		List<ImageFileVO> imageFileList = boardDAO.selectImageFileList(reviewBoardNO);
		boardMap.put("board", boardVO);
		boardMap.put("imageFileList", imageFileList);
		return boardMap;
	}

	@Override
	public int addReview(Map boardMap) throws Exception {
		int boardNO = boardDAO.addReview(boardMap);
		boardMap.put("boardNO", boardNO);
		boardDAO.insertReviewImageFile(boardMap);
		return boardNO;
	}

	@Override
	public void boardPush(int reviewBoardNO) throws Exception {
		boardDAO.boardPush(reviewBoardNO);
	}

	@Override
	public void boardView(int reviewBoardNO) throws Exception {
		boardDAO.boardView(reviewBoardNO);
	}

	@Override
	public List<BoardVO> selectReviewList(String member_id) throws Exception {
		List<BoardVO> selectReviewList = boardDAO.selectReviewList(member_id);
		return selectReviewList;
	}

	@Override
	public void delete(int boardNO) throws Exception {
		boardDAO.delete(boardNO);
	}

	@Override
	public void deleteNotice(int boardNO) throws Exception {
		boardDAO.deleteNotice(boardNO);
	}

	@Override
	public void deleteEvent(int boardNO) throws Exception {
		boardDAO.deleteEvent(boardNO);
	}

	@Override
	public List deleteImage(int boardNO) throws Exception {
		List<ImageFileVO> deleteImageList = boardDAO.deleteImage(boardNO);
		boardDAO.deleteImageDB(boardNO);
		return deleteImageList;
	}

	@Override
	public List deleteImageEvent(int boardNO) throws Exception {
		List<ImageFileVO> deleteImageList = boardDAO.deleteImageEvent(boardNO);
		boardDAO.deleteImageDBEvent(boardNO);
		return deleteImageList;
	}

	@Override
	public int addEvent(Map boardMap) throws Exception {
		int boardNO = boardDAO.addEvent(boardMap);
		boardMap.put("boardNO", boardNO);
		boardDAO.insertEventImageFile(boardMap);
		return boardNO;
	}

	@Override
	public int addNotice(Map boardMap) throws Exception {
		int boardNO = boardDAO.addNotice(boardMap);
		boardMap.put("boardNO", boardNO);
		return boardNO;
	}

}
