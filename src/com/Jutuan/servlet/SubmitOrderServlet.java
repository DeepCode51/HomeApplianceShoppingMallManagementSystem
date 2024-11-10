package com.Jutuan.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jutuan.bean.Product;
import com.Jutuan.bean.ShopCart;
import com.Jutuan.bean.Users;
import com.Jutuan.service.OrderService;
import com.Jutuan.service.ProductService;

/**
 * Servlet implementation class SubmitOrderServlet 提交订单servlet
 */
@WebServlet("/SubmitOrderServlet")
public class SubmitOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubmitOrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 接收中文乱码处理
		request.setCharacterEncoding("UTF-8");
		// 响应中文乱码处理
		response.setContentType("text/html; charset=UTF-8");
		System.out.println();
		Map<String, ShopCart> cartMapSession = (Map<String, ShopCart>) request.getSession().getAttribute("cartMap");
		System.out.println("cartMapSession" + cartMapSession);
		if (null != cartMapSession) {

			Iterator<Entry<String, ShopCart>> iterator = cartMapSession.entrySet().iterator();

			while (iterator.hasNext()) {
				Entry<String, ShopCart> next = iterator.next();
				String pid = next.getKey();
				ShopCart value = next.getValue();
				String sum = String.valueOf(value.getSum());

				String address = request.getParameter("address");

				String user = (String) request.getSession().getAttribute("username");

				ProductService productSerivce = new ProductService();
				List<Product> list = productSerivce.queryAll();
				// lambda获取单个商品
				Product product = list.stream().filter(x -> x.getPid().equals(pid)).collect(Collectors.toList()).get(0);
				// 查询商品是否可以购买下单
				boolean canByBoolean = product.getPdate()
						.equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString());

				if (canByBoolean) {
					OrderService orderService = new OrderService();

					orderService.save(product, sum, address, user);

				} else {
				}

			}

		}   
		
		request.getSession().removeAttribute("cartMap");

		request.setAttribute("subOrder", "下单成功");
		request.getRequestDispatcher("/mycart.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
