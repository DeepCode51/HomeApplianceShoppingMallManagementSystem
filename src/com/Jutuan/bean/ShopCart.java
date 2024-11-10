package com.Jutuan.bean;

import java.io.Serializable;

public class ShopCart implements Serializable {

    private Product product;
    private Integer sum;

    public ShopCart(Product book, Integer sum2) {
        // TODO Auto-generated constructor stub
        this.product = book;
        this.sum = sum2;
    }

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
