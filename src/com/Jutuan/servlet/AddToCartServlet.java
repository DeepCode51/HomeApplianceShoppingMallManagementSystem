package com.Jutuan.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Jutuan.bean.Product;
import com.Jutuan.bean.ShopCart;
import com.Jutuan.service.ProductService;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddToCartServlet() {
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

		List<Product> list = this.productService.queryAll();

		// TODO Auto-generated method stub
		String pid = String.valueOf(request.getParameter("pid"));

		Integer sum = Integer.parseInt(String.valueOf(request.getParameter("sum")));

		HttpSession session = request.getSession();

		Map<String, ShopCart> cartMapSession = (Map<String, ShopCart>) session.getAttribute("cartMap");

		if (null == cartMapSession) {
			cartMapSession = new HashMap<String, ShopCart>();

			Product book = list.stream().filter(x -> x.getPid().equals(pid)).collect(Collectors.toList()).get(0);

			ShopCart bookShopCart = new ShopCart(book, sum);

			cartMapSession.put(pid, bookShopCart);
			
			System.out.println(book);

			session.setAttribute("cartMap", cartMapSession);

		} else {
			// 已经存在过相关数据
			ShopCart bookshopCart = cartMapSession.get(pid);
			if (null == bookshopCart) {
				Product book = list.stream().filter(x -> x.getPid().equals(pid)).collect(Collectors.toList()).get(0);
				ShopCart bookShopCart = new ShopCart(book, sum);
				System.out.println(book);
				cartMapSession.put(pid, bookShopCart);

				session.setAttribute("cartMap", cartMapSession);
			} else {

				int sumOld = bookshopCart.getSum();

				bookshopCart.setSum(sumOld + sum);

				cartMapSession.put(pid, bookshopCart);
				session.setAttribute("cartMap", cartMapSession);

			}
		}  

		try {
			response.getOutputStream().print("success");
		} catch (Exception e) {
			// TODO Auto-generated catch block

		} finally {

		}
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
