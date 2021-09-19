package com.lee.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lee.model.Order;
import com.lee.util.DBUtil;

public class OrderDao {
	private SqlSession sqlSession;

	public OrderDao() {
		sqlSession = DBUtil.getSqlSession();
	}
	public void addOrder(Order order) {
		sqlSession.insert("OrderMapper.addOrder", order);
		sqlSession.commit();
	}
	
	public List<Order> getOrders(){
		List<Order> bs = new ArrayList<Order>();
		bs = sqlSession.selectList("OrderMapper.getOrders");
		return bs;
	}
}
