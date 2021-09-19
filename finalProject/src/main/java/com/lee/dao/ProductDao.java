package com.lee.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.lee.model.Order;
import com.lee.model.Product;
import com.lee.util.DBUtil;

public class ProductDao {
	private SqlSession sqlSession;

	public ProductDao() {
		sqlSession = DBUtil.getSqlSession();
	}
	public void addProduct(Product product) {
		sqlSession.insert("ProductMapper.addProduct",product);
		sqlSession.commit();
	}
	public void updateProduct(Product product) {
		sqlSession.update("ProductMapper.updateProduct", product);
		sqlSession.commit();
	}
	public void deleteProduct(String id) {
		sqlSession.delete("ProductMapper.deleteProduct", id);
	}
	public List<Product> showProduct(){
		List<Product> ps = new ArrayList<Product>();
		ps = sqlSession.selectList("ProductMapper.showProduct");
		return ps;
	}
	public Product getProduct(String name) {
		Product product = sqlSession.selectOne("ProductMapper.getProduct", name);
		return product;
	}
	public void order(Order order) {
		sqlSession.update("ProductMapper.order",order);
		sqlSession.commit();
	}
}
