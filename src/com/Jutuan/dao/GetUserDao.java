package com.Jutuan.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Jutuan.ConnectDB.GetConnect;
import com.Jutuan.bean.Users;

/**
 * 
 * 获取用户的名称
 *
 */
public class GetUserDao {
	public List<Users> GetUserName(String username) {
		//实例化ConnectDB对象
		
		GetConnect connerctDB = new GetConnect();
		//接受查询返回值
		List<Users> list = new ArrayList<Users>();
		SqlSession sqlSession = null;
		try {
			//获取SqlSession对象
			sqlSession = connerctDB.getSqlSession();
			//执行Sql语句
			list = sqlSession.selectList("UsersOpera.GetUserName",username);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(sqlSession != null) {
				sqlSession.close();
			}		
		}
		return list;		
	}

	public void updateAddress(String username, String address) {
		// TODO Auto-generated method stub
		//实例化ConnectDB对象
		
				GetConnect connerctDB = new GetConnect();
				//接受查询返回值
			
				SqlSession sqlSession = null;
				try {
					//获取SqlSession对象
					sqlSession = connerctDB.getSqlSession();
					//执行Sql语句
					Users user=new Users();
					user.setUsername(username);
					user.setAddress(address);
					System.out.println(address);
					sqlSession.update("UsersOpera.updateAddress",user);
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

