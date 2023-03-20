package com.project.movie.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface OrderDAO {

	// 빠른 예매 화면에 나올 리스트
	public List selectMovieTitleList() throws DataAccessException;

	public List selectMovieTitleList1() throws DataAccessException;

	// 좌석 리스트 조회
	public List seatStatusList() throws DataAccessException;

	public List seatStatusList1() throws DataAccessException;

	public List seatStatusList2() throws DataAccessException;

	public void addOrder(Map orderMap) throws DataAccessException;

	public void seatStatusUpdate(Map orderMap) throws DataAccessException;

	public void seatStatusUpdate1(Map orderMap) throws DataAccessException;

	public void seatStatusUpdate2(Map orderMap) throws DataAccessException;

	public int findMovieId(String movie_title) throws DataAccessException;

	public List selectMyOrderDetailInfo(String member_id) throws DataAccessException;

}
