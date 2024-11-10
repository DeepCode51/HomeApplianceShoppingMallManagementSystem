package com.Jutuan.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Jutuan.ConnectDB.GetConnect;
import com.Jutuan.bean.Product;

public class FindNewProductDao {
	public List<Product> findNewProductDao() {
		//实例化ConnectDB对象
		System.out.println("1");
		GetConnect connerctDB = new GetConnect();
		Product product = new Product();
		product.setPflag(1);
		product.setCount(6);
		//接受查询返回值
		List<Product> list = new ArrayList<Product>();
		SqlSession sqlSession = null;
		try {
			//获取SqlSession对象
			sqlSession = connerctDB.getSqlSession();
			//执行Sql语句
			list = sqlSession.selectList("ProductOpera.FindNewProduct",product);
		
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

	public void save(Product product) {
		// TODO Auto-generated method stub
		
	}
}
