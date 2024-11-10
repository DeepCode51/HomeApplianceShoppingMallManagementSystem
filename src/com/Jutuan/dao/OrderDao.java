package com.Jutuan.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Jutuan.ConnectDB.GetConnect;
import com.Jutuan.bean.Orders;
import com.Jutuan.bean.Product;
/**
 * 订单Dao类
 * @author Administrator
 *
 */
public class OrderDao {
	/**
	 * 增加订单
	 * @param orders
	 */
	public void save(Orders orders) {
		// TODO Auto-generated method stub
		GetConnect connerctDB = new GetConnect();
		SqlSession sqlSession = null;
		try {
			// 获取sqlsession对象
			sqlSession = connerctDB.getSqlSession();
			// 执行sql语句
			sqlSession.insert("OrdersMapper.insert", orders);
			// 提交事务
			sqlSession.commit();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();  
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
	}
	/**
	 * 查询所有订单
	 * @return
	 */
	
	public List<Orders> queryAll() {
		// 实例化ConnectDB对象

		GetConnect connerctDB = new GetConnect();
		// 接受查询返回值
		List<Orders> list = new ArrayList<Orders>();
		SqlSession sqlSession = null;
		try {
			// 获取SqlSession对象
			sqlSession = connerctDB.getSqlSession();
			// 执行Sql语句
			list = sqlSession.selectList("OrdersMapper.queryAll");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
		return list;

	}

}
