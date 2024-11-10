package com.Jutuan.bean;

import java.io.Serializable;
/**
 * 订单商品计数实体
 * @author Administrator
 *
 */
public class ProOrdSum implements Serializable {
	//订单商品
	private Product product;
	//商品总下单数量
	private Integer sum;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getSum() {
		return sum;
	}

	public void setSum(Integer sum) {
		this.sum = sum;
	}
	

}
