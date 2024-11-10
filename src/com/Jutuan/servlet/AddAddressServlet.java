package com.Jutuan.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jutuan.service.UserService;

/**
 * Servlet implementation class AddAddressServlet
 */
@WebServlet("/AddAddressServlet")
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAddressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 接收中文乱码处理
		request.setCharacterEncoding("UTF-8");
	// 响应中文乱码处理
		response.setContentType("text/html; charset=UTF-8");
		
		String newaddress=request.getParameter("address");
		String username=(String) request.getSession().getAttribute("username");
		
		UserService userService=new UserService();
		String oldaddress=(String) request.getAttribute("address");
		List<String> list=(List<String>) request.getSession().getAttribute("address");
		List<String> arrList=null;
		if(list!=null&&!list.isEmpty()) {
	         arrList = new ArrayList(list);
	        arrList.add(newaddress);
		}else {
			list=new ArrayList<String>();
	        arrList = new ArrayList(list);
	        arrList.add(newaddress);
			
		}
		userService.updateAddress(username,arrList);

		request.getSession().setAttribute("address",arrList);
		
		String pid = request.getParameter("pid");
		String sum = request.getParameter("sum");
		
		request.setAttribute("pid", pid);
		request.setAttribute("sum", sum);   
		
		request.getRequestDispatcher("detailmyaddress.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
