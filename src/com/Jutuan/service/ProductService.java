package com.Jutuan.service;

import com.Jutuan.bean.Product;
import com.Jutuan.dao.FindNewProductDao;
import com.Jutuan.dao.ProductDao;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 产品业务类
 * 
 * @author Administrator
 *
 */
public class ProductService {

	private ProductDao productDao = new ProductDao();

	/**
	 * 
	 * 查询最新商品
	 */
	public List<Product> findByNew() {
		FindNewProductDao findNewProductDao = new FindNewProductDao();
		return findNewProductDao.findNewProductDao();
	}

	/**
	 * 增加产品
	 * 
	 * @param product
	 */
	public void saveProduct(Product product) {

		// TODO Auto-generated method stub
		product.setPid(UUID.randomUUID().toString().substring(0, 32));
		product.setPdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		productDao.save(product);

	}
    public void updateProduct(Product product) {
        // TODO Auto-generated method stub
        product.setPdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        productDao.save(product);

    }



    /**
     * 得到产品
     *
     * @param pid
     */
    public Product getProductById( String pid) {

        // TODO Auto-generated method stub
      return productDao.getProductById(pid);

    }


	/**
	 * 查询所有产品
	 * 
	 * @return
	 */
	public List<Product> queryAll() {
		// TODO Auto-generated method stub
		return productDao.queryAll();
	}

	/**
	 * 查询精选6个产品
	 * 
	 * @return
	 */

	public List<Product> findBySelected() {
		// TODO Auto-generated method stub
		List<Product> product = productDao.queryAll();
		product = product.stream()
				.filter(x -> x.getPflag() == 0
						&& x.getPdate().equals(String.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(new Date()))))
				.collect(Collectors.toList());

		if (product != null && !product.isEmpty()) {  
			if (product.size() > 6) {
				product = product.subList(0, 6);
			}
			return product;

		} else {
			return Collections.EMPTY_LIST;
		}
	}

	/**
	 * 查询昨日6个产品
	 * 
	 * @return
	 */

	public List<Product> findYesterdayProduct() {
		// TODO Auto-generated method stub
		List<Product> product = productDao.queryAll();
		product = product.stream()
				.filter(x -> x.getPflag() == 0 && x.getPdate()
						.equals(String.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(getYesterday(new Date())))))
				.collect(Collectors.toList());

		if (product != null && !product.isEmpty()) {
			if (product.size() > 6) {
				product = product.subList(0, 6);
			}
			return product;

		} else {
			return Collections.EMPTY_LIST;
		}
	}

	/**
	 * 获得昨天日期
	 * 
	 * @param today
	 * @return
	 */
	private Date getYesterday(Date today) {

		Calendar c = Calendar.getInstance();

		c.setTime(today);

		c.add(Calendar.DAY_OF_MONTH, -1);

		return c.getTime();
	}

}
