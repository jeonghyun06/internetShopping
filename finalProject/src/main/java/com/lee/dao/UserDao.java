package com.lee.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.lee.model.Board;
import com.lee.model.User;
import com.lee.util.DBUtil;

public class UserDao {
	private SqlSession sqlSession;
	
	public UserDao() {
		sqlSession = DBUtil.getSqlSession();
	}
	
	public User getUserById(@Param("userid") String string) {
		User user = sqlSession.selectOne("UserMapper.getUserbyId", string);
		return user;
	}
	
	public void addUser(User user) {
		sqlSession.insert("UserMapper.addUser", user);
		sqlSession.commit();
	}
	
	public void deleteUser(String string) {
		sqlSession.delete("UserMapper.deleteUser", string);
		sqlSession.commit();
	}
	
	public String getPw(String id) {
		String pw = sqlSession.selectOne("UserMapper.getPw", id);
		return pw;
	}
	
	public void updateUser(User user) {
		sqlSession.update("UserMapper.updateUser", user);
		sqlSession.commit();
	}
	
	public List<User> getAllUsers(){
		List<User> bs = new ArrayList<User>();
		bs = sqlSession.selectList("UserMapper.getAllUsers");
		return bs;
	}
}
