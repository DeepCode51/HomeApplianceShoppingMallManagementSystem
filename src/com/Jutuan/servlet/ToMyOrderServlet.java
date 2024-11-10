package com.Jutuan.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jutuan.bean.Orders;
import com.Jutuan.service.OrderService;

/**
 * Servlet implementation class ToMyOrderServlet
 */
@WebServlet("/ToMyOrderServlet")
public class ToMyOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ToMyOrderServlet() {
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
		OrderService orderService = new OrderService();
		String user = (String) request.getSession().getAttribute("username");
		List<Orders> list = orderService.queryAll();
		List<Orders> listArr = new ArrayList<>();
		System.out.println(user);
		for (int i = 0; i < list.size(); i++) {
			String username = list.get(i).getUsername();
			System.out.println(username + "-");
			if (username.equals(user)) {
				listArr.add(list.get(i));
			}
		}

		request.setAttribute("list", listArr);

		request.getRequestDispatcher("/myorder.jsp").forward(request, response);
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
