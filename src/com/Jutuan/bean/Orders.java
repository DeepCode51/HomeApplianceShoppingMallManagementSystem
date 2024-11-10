package com.Jutuan.bean;
/**
 * 订单实体
 * @author Administrator
 *
 */
public class Orders {
	//订单id
    private String ordernum;
   //商品id
    private String pid;
//  商品名称
    private String pname;
    //订单时间
    private String ordertime;
    //订单商品数量
    private Integer ocount;
    //订单总价格
    private Float oprice;
    //订单详情
    private String pdesc;
    //订单下单用户用户名
    private String username;
    //订单地址
    private String address;
    

    public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrdernum() {
        return ordernum;
    }

    public void setOrdernum(String ordernum) {
        this.ordernum = ordernum == null ? null : ordernum.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime == null ? null : ordertime.trim();
    }

    public Integer getOcount() {
        return ocount;
    }

    public void setOcount(Integer ocount) {
        this.ocount = ocount;
    }

    public Float getOprice() {
        return oprice;
    }

    public void setOprice(Float oprice) {
        this.oprice = oprice;
    }

    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc == null ? null : pdesc.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    @Override
    public String toString() {
        return "Orders{" +
                "ordernum='" + ordernum + '\'' +
                ", pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", ordertime='" + ordertime + '\'' +
                ", ocount=" + ocount +
                ", oprice=" + oprice +
                ", pdesc='" + pdesc + '\'' +
                ", username='" + username + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}