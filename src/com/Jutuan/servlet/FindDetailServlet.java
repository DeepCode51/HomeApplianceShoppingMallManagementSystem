package com.Jutuan.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Jutuan.bean.Product;
import com.Jutuan.service.ProductService;

/**
 * Servlet implementation class FindDetailServlet
 * 查询商品细节servet
 */
@WebServlet("/FindDetailServlet")
public class FindDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid=request.getParameter("pid");
		ProductService productSerivce = new ProductService();
		List<Product> list = productSerivce.queryAll();
		Product product=list.stream().filter(x->x.getPid().equals(pid)).collect(Collectors.toList()).get(0);
		List<String> listStr=Arrays.asList(product.getPdesc().split("。"));
		//浏览计数，获取application域对象。计数和商品的数据结构Map<String,Integer>  key->商品id,value->商品数量
		Map<String,Integer> map=(Map<String, Integer>) request.getServletContext().getAttribute("seeSum");
		int sumSee=1;
		if(map!=null) {
			Integer sum=map.get(pid);
			if(null!=sum) {
			map.put(pid, ++sum);
			sumSee=sum;
			}else {
				map.put(pid, 1);
			}
		}else {
			map=new HashMap<>();
			map.put(pid, 1);
		}
		request.getServletContext().setAttribute("seeSum", map);
		request.setAttribute("sum", sumSee);
		request.setAttribute("v", product);
		request.setAttribute("listStr", listStr);      
		//根据商品是否今日上线来判断是否可购买
		request.setAttribute("canby", product.getPdate().equals(new SimpleDateFormat("yyyy-MM-dd").format(new Date()).toString())?"yes":"no");
		request.getRequestDispatcher("/admin/detailpro.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
