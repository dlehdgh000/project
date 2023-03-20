package com.project.movie.order.service;

import java.util.List;
import java.util.Map;

import com.project.movie.order.vo.OrderVO;

public interface OrderService {

	// 빠른 예매 화면에 나올 리스트
	public List<OrderVO> MovieTitleList() throws Exception;

	public List<OrderVO> MovieTitleList1() throws Exception;

	// 좌석 리스트
	public List<OrderVO> selectSeatList() throws Exception;

	public List<OrderVO> selectSeatList1() throws Exception;

	public List<OrderVO> selectSeatList2() throws Exception;

	public void addOrder(Map orderMap) throws Exception;

	public int findMovieId(String movie_title) throws Exception;

	public List<OrderVO> selectMyOrderDetailInfo(String member_id) throws Exception;

}
