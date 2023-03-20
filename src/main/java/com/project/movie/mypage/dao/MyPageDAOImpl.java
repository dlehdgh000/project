package com.project.movie.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.movie.member.vo.MemberVO;
import com.project.movie.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;

	// 占쎄땀占쎌젟癰귨옙
	@Override
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException {
		System.out.println("member_id" + member_id);
		System.out.println("member_id" + member_id);
		System.out.println("member_id" + member_id);
		MemberVO memberInfo = (MemberVO) sqlSession.selectOne("mapper.mypage.selectMyDetailInfo", member_id);

		System.out.println(memberInfo.toString());
		return memberInfo;
	}

//  占쎌굙筌띲끇沅∽옙肉� �뵳�딅뮞占쎈뱜
//	@Override
//	public List<OrderVO> selectMyOrderGoodsList(String member_id2) throws DataAccessException {
//		List<OrderVO> orderGoodsList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderGoodsList",member_id2);
//		return orderGoodsList;
//	}

//	占쎌굙筌띲끇沅∽옙肉� 占쎌쁽占쎄쉭占쎌뿳癰귣떯由�
	@Override
	public List selectMyOrderInfo(String member_id) throws DataAccessException {
		List orderInfoList = (List) sqlSession.selectList("mapper.mypage.selectMyOrderDetailInfo", member_id);
		return orderInfoList;
	}

	// 占쎄땀 �뵳�됰윮癰귣떯由�
	@Override
	public List selectMyReviewInfo(String id) throws DataAccessException {
		List reviewInfoList = (List) sqlSession.selectList("mapper.mypage.selectMyReview");
		return reviewInfoList;
	}

	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo", memberMap);
	}

}
