package com.project.movie.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.movie.member.vo.MemberVO;
import com.project.movie.order.vo.OrderVO;

public interface MyPageDAO {
//// 占쎄땀 占쎌굙筌띲끇沅∽옙肉�
//	public List<OrderVO> selectMyOrderGoodsList(String member_id2) throws DataAccessException;
//	占쎌굙筌띲끇沅∽옙肉� 占쎄맒占쎄쉭癰귣떯由�
	public List selectMyOrderInfo(String member_id2) throws DataAccessException;

////	占쎄텊筌욎뮆�� 占쎌굙筌띲끇沅∽옙肉�
//	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException;
////	占쎄땀 占쎌젟癰귨옙 占쎈땾占쎌젟
	public void updateMyInfo(Map memberMap) throws DataAccessException;

//	占쎄땀 占쎄맒占쎄쉭占쎌젟癰귨옙
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
////	占쎌굙筌띲끉�옱占쎈꺖
//	public void updateMyOrderCancel(String order_id) throws DataAccessException;

// 	占쎄땀 �뵳�됰윮癰귣떯由�
	public List selectMyReviewInfo(String id) throws DataAccessException;

}
