package com.project.movie.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.movie.member.vo.MemberVO;

public interface MemberDAO {

	public void insertMember(MemberVO memberVO) throws DataAccessException;

	public String selectOverlappedID(String id) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public List selectAllMemberList();

}