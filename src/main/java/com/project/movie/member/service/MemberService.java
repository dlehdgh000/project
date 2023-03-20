package com.project.movie.member.service;

import java.util.List;
import com.project.movie.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO memberVO) throws Exception;

	public void addMember(MemberVO memberVO) throws Exception;

	public String overlapped(String id) throws Exception;

	public List listMembers();

}