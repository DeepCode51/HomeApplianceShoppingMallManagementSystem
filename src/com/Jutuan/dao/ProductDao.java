package com.Jutuan.dao;

import com.Jutuan.ConnectDB.GetConnect;
import com.Jutuan.bean.Product;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
/**
 * 商品Dao类
 * @author Administrator
 *
 */
public class ProductDao {
	/**
	 * 增加商品
	 * 
	 * @param product
	 */
	public void save(Product product) {
		// TODO Auto-generated method stub
		GetConnect connerctDB = new GetConnect();
		SqlSession sqlSession = null;
		try {
			// 获取sqlsession对象
			sqlSession = connerctDB.getSqlSession();
			// 执行sql语句
			sqlSession.insert("ProductOpera.save", product);
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
     * 查询商品
     *
     * @return
     */
    public Product getProductById(String pid) {
        // 实例化ConnectDB对象

        GetConnect connerctDB = new GetConnect();
        // 接受查询返回值
        Product product= new Product();
        SqlSession sqlSession = null;
        try {
            // 获取SqlSession对象
            sqlSession = connerctDB.getSqlSession();
            // 执行Sql语句
            product = sqlSession.selectOne("ProductOpera.getProductById",pid);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return product;

    }


	/**
	 * 查询所有商品
	 * 
	 * @return
	 */
	public List<Product> queryAll() {
		// 实例化ConnectDB对象

		GetConnect connerctDB = new GetConnect();
		// 接受查询返回值
		List<Product> list = new ArrayList<Product>();
		SqlSession sqlSession = null;
		try {
			// 获取SqlSession对象
			sqlSession = connerctDB.getSqlSession();
			// 执行Sql语句
			list = sqlSession.selectList("ProductOpera.queryAll");
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

	/**
	 * 减少商品库存
	 * 
	 * @param pro
	 */
	public void decreaseCount(Product pro) {
		// TODO Auto-generated method stub
		GetConnect connerctDB = new GetConnect();
		SqlSession sqlSession = null;
		try {
			// 获取sqlsession对象
			sqlSession = connerctDB.getSqlSession();
			// 执行sql语句
			System.out.println(pro.toString());
			sqlSession.update("ProductOpera.decreaseCount", pro);
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

	public void delProduct(String pid) {
		// TODO Auto-generated method stub
		GetConnect connerctDB = new GetConnect();
		SqlSession sqlSession = null;
		try {
			// 获取sqlsession对象
			sqlSession = connerctDB.getSqlSession();
			// 执行sql语句
			sqlSession.update("ProductOpera.del", pid);
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

}
