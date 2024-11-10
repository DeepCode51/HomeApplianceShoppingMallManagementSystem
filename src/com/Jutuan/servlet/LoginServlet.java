package com.Jutuan.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Jutuan.bean.ResultInfo;
import com.Jutuan.bean.Users;
import com.Jutuan.service.UserService;
import com.alibaba.fastjson.JSON;


/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
			
		//验证校验
        String check = request.getParameter("check");
        //从sesion中获取验证码
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//为了保证验证码只能使用一次
        //比较
        if(checkcode_server == null || !checkcode_server.equalsIgnoreCase(check)){
            //验证码错误
            ResultInfo info = new ResultInfo();
            //注册失败
            info.setFlag(false);
            info.setErrorMsg("验证码错误");
            //将info对象序列化为json
            String json = JSON.toJSONString(info);
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().write(json);
            return;
        }

		//接受表单数据
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//接收返回值
		int a = 0;
		//调用LoginInfor()验证用户
		UserService usersService = new UserService();
		a = usersService.LoginInfor(username, password);
		Users user = new Users();

		List<Users> list = new ArrayList<Users>();
//		获取用户的姓名
		list = usersService.GetUserName(username);
		
		ResultInfo info = new ResultInfo();
		if(a != 0){
            //登录成功
			user = list.get(0);
			String name = user.getName();
			String usernam=user.getUsername();
			request.getSession().setAttribute("user", name);  
			request.getSession().setAttribute("username", username);
			if(user.getAddress()!=null) {
			request.getSession().setAttribute("address", Arrays.asList(user.getAddress().split("###")));
			}
            info.setFlag(true);
            info.setRole(user.getRole());  
        }else{
            //登录失败
            info.setFlag(false);
            info.setErrorMsg("登录失败!");
        }

        //将info对象序列化为json
        String json = JSON.toJSONString(info);

        //将json数据写回客户端
        //设置content-type
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
