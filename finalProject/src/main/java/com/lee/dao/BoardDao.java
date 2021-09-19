package com.lee.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.lee.model.Board;
import com.lee.util.DBUtil;

public class BoardDao {
	private SqlSession sqlSession;
	
	public BoardDao() {
		sqlSession = DBUtil.getSqlSession();
	}

	public void addBoard(Board board) {
		sqlSession.insert("BoardMapper.addBoard", board);
		sqlSession.commit();
	}
	
	public List<Board> getAllBoards(){
		List<Board> bs = new ArrayList<Board>();
		bs = sqlSession.selectList("BoardMapper.getAllBoards");
		return bs;
	}
	public void deleteBoard(@Param("id") int id) {
		sqlSession.delete("BoardMapper.deleteBoard", id);
		sqlSession.commit();
	}
	
	public Board getBoard(@Param("id") int id) {
		Board board = sqlSession.selectOne("BoardMapper.getBoard", id);
		return board;
	}
}
