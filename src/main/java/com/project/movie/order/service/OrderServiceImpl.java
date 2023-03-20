package com.project.movie.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.movie.order.dao.OrderDAO;
import com.project.movie.order.vo.OrderVO;

@Service("orderService")
@Transactional(propagation = Propagation.REQUIRED) // 트랜잭션 적용
public class OrderServiceImpl implements OrderService {

	// 의존성 주입
	@Autowired
	private OrderDAO orderDAO;

	// 빠른 예매 화면에 나올 리스트
	@Override
	public List<OrderVO> MovieTitleList() throws Exception {
		List<OrderVO> titleList = orderDAO.selectMovieTitleList();
		return titleList;
	}

	@Override
	public List<OrderVO> MovieTitleList1() throws Exception {
		List<OrderVO> titleList1 = orderDAO.selectMovieTitleList1();
		return titleList1;
	}

	@Override
	public List<OrderVO> selectSeatList() throws Exception {
		List<OrderVO> seatList = orderDAO.seatStatusList();
		return seatList;
	}

	@Override
	public List<OrderVO> selectSeatList1() throws Exception {
		List<OrderVO> seatList1 = orderDAO.seatStatusList1();
		return seatList1;
	}

	@Override
	public List<OrderVO> selectSeatList2() throws Exception {
		List<OrderVO> seatList2 = orderDAO.seatStatusList2();
		return seatList2;
	}

	@Override
	public void addOrder(Map orderMap) throws Exception {
		orderDAO.addOrder(orderMap);
		orderDAO.seatStatusUpdate(orderMap);
		orderDAO.seatStatusUpdate1(orderMap);
		orderDAO.seatStatusUpdate2(orderMap);

	}

	@Override
	public int findMovieId(String movie_title) throws Exception {
		int resultMovieId = orderDAO.findMovieId(movie_title);
		return resultMovieId;
	}

	@Override
	public List<OrderVO> selectMyOrderDetailInfo(String member_id) throws Exception {
		List<OrderVO> selectMyOrderDetailInfo = orderDAO.selectMyOrderDetailInfo(member_id);
		return selectMyOrderDetailInfo;
	}

}
