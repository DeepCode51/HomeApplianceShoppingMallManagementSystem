package com.Jutuan.dao;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import com.Jutuan.ConnectDB.GetConnect;
import com.Jutuan.bean.Users;

/**
 * 
 * 验证用户是否存在
 *
 */
public class CheckDao {
	public int LoginInfor(String username, String passowrd) {
		//实例化ConnectDB对象
		GetConnect connerctDB = new GetConnect();
		//实例化User对象并设置属性
		Users user = new Users();
		user.setUsername(username);
		user.setPassword(passowrd);
		//接受查询返回值
		int a = 0;
		SqlSession sqlSession = null;
		try {
			//获取SqlSession对象
			sqlSession = connerctDB.getSqlSession();
			//执行Sql语句
			a = sqlSession.selectOne("UsersOpera.CheckUser",user);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(sqlSession != null) {
				sqlSession.close();
			}		
		}
		return a;		
	}
}

