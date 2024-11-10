package com.Jutuan.servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jutuan.bean.Orders;
import com.Jutuan.bean.ProOrdSum;
import com.Jutuan.bean.Product;
import com.Jutuan.service.OrderService;
import com.Jutuan.service.ProductService;

/**
 * Servlet implementation class FindAllOrdersGetSumServlet
 * 商品总计servlet
 */
@WebServlet("/FindAllOrdersGetSumServlet")
public class FindAllOrdersGetSumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindAllOrdersGetSumServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService productSerivce = new ProductService();
		List<Product> listPro = productSerivce.queryAll();
		
		OrderService orderService=new OrderService();
	 //查询所有订单
		List<Orders>listOrd=orderService.queryAll();
		//订单统计商品购买数量 
		List<ProOrdSum>listSum=listPro.stream().map(pro->{
			ProOrdSum proOrdSum=new ProOrdSum();
			proOrdSum.setProduct(pro);
			
			int sum=0;
			for(int i=0;i<listOrd.size();i++) {
				Orders o=listOrd.get(i);
				if(o.getPid().equals(pro.getPid())) {
				sum+=	o.getOcount();
				}
			}
			proOrdSum.setSum(sum);
			return proOrdSum;
		}).collect(Collectors.toList());
		
		request.setAttribute("list", listSum);
		request.getRequestDispatcher("/admin/listsum.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
