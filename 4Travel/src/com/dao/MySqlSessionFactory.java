package com.dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// Mybatis 에서 사용하는 SqlSession 리턴
public class MySqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory;
  static{
	String resource = "com/config/Configuration.xml";
	InputStream inputStream = null;
	try {
		inputStream = Resources.getResourceAsStream(resource);
		System.out.println("daotry통과");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		System.out.println("dao에러");
		e.printStackTrace();
	}
   sqlSessionFactory =
	new SqlSessionFactoryBuilder().build(inputStream);
  }//end static
   public static SqlSession openSession(){
	   System.out.println("dao통과");
	   return sqlSessionFactory.openSession();
   }
}//end class



