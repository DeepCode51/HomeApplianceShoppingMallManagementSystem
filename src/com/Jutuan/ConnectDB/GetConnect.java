package com.Jutuan.ConnectDB;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 
 * 数据库访问类
 *
 */
public class GetConnect {
	public SqlSession getSqlSession() throws IOException {
		//通过配置文件获取数据库信息
		Reader reader = Resources.getResourceAsReader("com/Jutuan/config/Configuration.xml");
		//通过配置信息构建一个SqlSessionFactory
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		//通过SqlSessionFactory打开一个数据库会话
		SqlSession sqlSession = sqlSessionFactory.openSession();
		System.out.print("数据库连接成功");
		return sqlSession;
	}
}
