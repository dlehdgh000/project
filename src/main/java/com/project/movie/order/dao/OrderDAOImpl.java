package com.project.movie.order.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.movie.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {

	// 의존성 주입
	@Autowired
	private SqlSession sqlSession;

	// 빠른 예매 화면에 나올 리스트(상영중)
	@Override
	public List selectMovieTitleList() throws DataAccessException {
		List<OrderVO> titleList = sqlSession.selectList("mapper.order.selectMovieTitleList");
		return titleList;
	}

	@Override  //(상영 예정)
	public List selectMovieTitleList1() throws DataAccessException {
		List<OrderVO> titleList1 = sqlSession.selectList("mapper.order.selectMovieTitleList1");
		return titleList1;
	}

	@Override //1관 좌석 업데이트(유저 예매시)
	public List seatStatusList() throws DataAccessException {
		List<OrderVO> seatList = sqlSession.selectList("mapper.order.seatList");
		return seatList;
	}

	@Override //2관 좌석 업데이트(유저 예매시)
	public List seatStatusList1() throws DataAccessException {
		List<OrderVO> seatList1 = sqlSession.selectList("mapper.order.seatList1");
		return seatList1;
	}

	@Override //3관 좌석 업데이트(유저 예매시)
	public List seatStatusList2() throws DataAccessException {
		List<OrderVO> seatList2 = sqlSession.selectList("mapper.order.seatList2");
		return seatList2;
	}

	@Override //영화 예매시 정보 추가
	public void addOrder(Map orderMap) throws DataAccessException {
		sqlSession.insert("mapper.order.addOrder", orderMap);
	}

	@Override //1관 좌석 업데이트(관리자)
	public void seatStatusUpdate(Map orderMap) throws DataAccessException {
		sqlSession.update("mapper.order.seatStatusUpdate", orderMap);

	}

	@Override //2관 좌석 업데이트(관리자)
	public void seatStatusUpdate1(Map orderMap) throws DataAccessException {
		sqlSession.update("mapper.order.seatStatusUpdate1", orderMap);

	}

	@Override // 3관 좌석 업데이트(관리자)
	public void seatStatusUpdate2(Map orderMap) throws DataAccessException {
		sqlSession.update("mapper.order.seatStatusUpdate2", orderMap);

	}

	@Override//영화 아이디 찾기
	public int findMovieId(String movie_title) throws DataAccessException {
		int resultMovieId = sqlSession.selectOne("mapper.order.findMovieId", movie_title);
		return resultMovieId;
	}

	@Override //예매하기 정보
	public List selectMyOrderDetailInfo(String member_id) throws DataAccessException {
		List<OrderVO> selectMyOrderDetailInfo = sqlSession.selectList("mapper.order.selectMyOrderDetailInfo",
				member_id);
		return selectMyOrderDetailInfo;
	}

}
