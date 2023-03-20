package com.project.movie.mypage.service;

import java.util.List;
import java.util.Map;

import com.project.movie.member.vo.MemberVO;
import com.project.movie.order.vo.OrderVO;

public interface MyPageService {
//	占쎄땀 占쎌굙筌랃옙 占쎄땀占쎈열
//	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception;
//	占쎌굙筌띲끇沅∽옙肉� 占쎄맒占쎄쉭
	public List findMyOrderInfo(String member_id2) throws Exception;

////	占쎄텊筌욎뮆�� 占쎌굙筌띲끇沅∽옙肉�
//	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
////	占쎄땀 占쎌젟癰귨옙 占쎈땾占쎌젟
	public MemberVO modifyMyInfo(Map memberMap) throws Exception;

////  占쎌굙筌랃옙 占쎄텣占쎌젫	
//	public void cancelOrder(String order_id) throws Exception;
//	占쎄땀 占쎌젟癰귨옙 占쎄맒占쎄쉭癰귣떯由�
	public MemberVO myDetailInfo(String member_id) throws Exception;

//  占쎄땀 �뵳�됰윮 癰귣떯由�
	public List myDetailreview(String id) throws Exception;
}
