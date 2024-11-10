package com.Jutuan.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.Jutuan.bean.Orders;
import com.Jutuan.bean.Product;
import com.Jutuan.bean.Users;
import com.Jutuan.dao.OrderDao;
import com.Jutuan.dao.ProductDao;

/**
 * 订单业务类
 * 
 * @author Administrator
 *
 */
public class OrderService {
	private OrderDao orderDao = new OrderDao();

	private ProductDao productDao = new ProductDao();

	/**
	 * 增加订单
	 * 
	 * @param product
	 * @param sum
	 * @param user
	 */
	public void save(Product product, String sum,String address, String user) {
		// TODO Auto-generated method stub
		Orders order = new Orders();

		order.setUsername(user);

		order.setPid(product.getPid());
		order.setPname(product.getPname());
		
		order.setAddress(address); 

		order.setOrdertime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

		order.setOcount(Integer.parseInt(sum));
		float price = (float) (Integer.parseInt(sum) * product.getShop_price());
		order.setOprice(price);

		order.setOrdernum(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()).toString()
				+ UUID.randomUUID().toString().substring(0, 18));

		order.setPdesc("");

		// 商品减少库存

		product.setCount(product.getCount() - Integer.parseInt(sum));

		productDao.decreaseCount(product);

		orderDao.save(order);

	}

	/**
	 * 查询订单
	 * 
	 * @return
	 */

	public List<Orders> queryAll() {
		// TODO Auto-generated method stub
		return orderDao.queryAll();
	}

}
