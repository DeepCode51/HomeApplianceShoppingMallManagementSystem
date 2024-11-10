package com.Jutuan.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jutuan.bean.Product;
import com.Jutuan.service.ProductService;

/**
 * Servlet implementation class IndexServlet
 * 进入首页servlet
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService productService = new ProductService();
		List<Product> newList = productService.findBySelected();
		List<Product> yesterdayListPro = productService.findYesterdayProduct();
		
		request.getSession().setAttribute("newList", newList);
		request.getSession().setAttribute("yesterdayListPro", yesterdayListPro);
		
		request.getSession().setAttribute("newListOther", 6-newList.size());
		 
		request.getSession().setAttribute("yesterdayListProOther", 6-yesterdayListPro.size());
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
