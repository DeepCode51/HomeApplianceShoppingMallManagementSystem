package com.Jutuan.bean;

public class Product {
	 private String pid;
	 private String pname;
	 private Double market_price;
	 private Double shop_price;
	 private String pimage;
	 private String pdate;
	 private int is_new;//1为热门，0为不热门
	 private String pdesc;//商品简介
	 private int pflag;//商品是否下架0为没下架，1为下架
	 private int count;
	 private String summary;//摘要
	 private String characteristics;//特点
	 private String delivery_time;//发货时间
 
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}
	public Double getShop_price() {
		return shop_price;
	}
	public void setShop_price(Double shop_price) {
		this.shop_price = shop_price;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getPflag() {
		return pflag;
	}
	public void setPflag(int pflag) {
		this.pflag = pflag;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getCharacteristics() {
		return characteristics;
	}
	public void setCharacteristics(String characteristics) {
		this.characteristics = characteristics;
	}
	public String getDelivery_time() {
		return delivery_time;
	}
	public void setDelivery_time(String delivery_time) {
		this.delivery_time = delivery_time;
	}
	public int getIs_new() {
		return is_new;
	}
	public void setIs_new(int is_new) {
		this.is_new = is_new;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", market_price=" + market_price + ", shop_price="
				+ shop_price + ", pimage=" + pimage + ", pdate=" + pdate + ", is_new=" + is_new + ", pdesc=" + pdesc
				+ ", pflag=" + pflag + ", count=" + count + ", summary=" + summary + ", characteristics="
				+ characteristics + ", delivery_time=" + delivery_time + "]";
	}
	
	 
}
