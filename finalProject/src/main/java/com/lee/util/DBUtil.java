package com.lee.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBUtil {

	private static SqlSessionFactory sqlSecFactory = null;
	
	static{
		String resorce = "mybatis-config.xml";
		try {
			InputStream is =  Resources.getResourceAsStream(resorce);
		
			sqlSecFactory = new SqlSessionFactoryBuilder().build(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSqlSession() {
		
		return sqlSecFactory.openSession();
	}
	
	public static void closeSqlsession(SqlSession sqlSession) {
		if(sqlSession!=null) {
			sqlSession.close();
		}
	}
	
}
