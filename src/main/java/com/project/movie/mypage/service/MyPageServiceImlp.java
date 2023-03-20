package com.project.movie.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.movie.member.vo.MemberVO;
import com.project.movie.mypage.dao.MyPageDAO;

@Service("myPageService")
public class MyPageServiceImlp implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;

	// 占쎄땀 占쎌젟癰귨옙 占쎌쁽占쎄쉭占쎌뿳癰귣떯由�
	@Override
	public MemberVO myDetailInfo(String member_id) throws Exception {
		MemberVO memberInfoList = myPageDAO.selectMyDetailInfo(member_id);
		return memberInfoList;

	}

	// 占쎌굙筌랃옙 占쎄땀占쎈열 占쎌쁽占쎄쉭占쎌뿳癰귣떯由�
	@Override
	public List findMyOrderInfo(String member_id2) throws Exception {
		List orderInfoList = myPageDAO.selectMyOrderInfo(member_id2);
		return orderInfoList;
	}

	@Override
	public List myDetailreview(String id) throws Exception {
		List reviewInfoList = myPageDAO.selectMyReviewInfo(id);
		return reviewInfoList;
	}

	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception {
		String member_id = (String) memberMap.get("member_id");
		myPageDAO.updateMyInfo(memberMap);
		return myPageDAO.selectMyDetailInfo(member_id);
	}

}
