package com.Jutuan.dao;
/**
 * 添加用户注册信息
 */
import java.io.IOException;


import org.apache.ibatis.session.SqlSession;

import com.Jutuan.ConnectDB.GetConnect;
import com.Jutuan.bean.Users;

public class AddUserDao {
	public void AddUser(Users user) {
		//实例化ConnectDB对象
		GetConnect connerctDB = new GetConnect();
		SqlSession sqlSession = null;
		try {
			//获取sqlsession对象
			sqlSession = connerctDB.getSqlSession();
			//执行sql语句
			sqlSession.insert("UsersOpera.userinsert",user);
			//提交事务
			sqlSession.commit();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(sqlSession != null) {
				sqlSession.close();
			}		
		}
	}
}