package com.Jutuan.servlet;

import com.Jutuan.bean.Product;
import com.Jutuan.dao.ProductDao;
import com.Jutuan.service.ProductService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Servlet implementation class AddProductServlet
 * 增加商品servlet
 */
@WebServlet("/addProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		 {
		//获取前端的传过来属性值
		Product product = new Product();
		

		
		// TODO Auto-generated method stub
		// 得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
		String savePath = this.getServletContext().getRealPath("/image");
		File file = new File(savePath);
		// 判断上传文件的保存目录是否存在
		if (!file.exists() && !file.isDirectory()) {
			System.out.println(savePath + "目录不存在，需要创建");
			// 创建目录
			file.mkdir();
		}
		// 消息提示
		String message = "";
		String filename="";
		try {
			// 使用Apache文件上传组件处理文件上传步骤：
			// 1、创建一个DiskFileItemFactory工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 解决上传文件名的中文乱码
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			/*
			 * if (!ServletFileUpload.isMultipartContent(request)) { // 按照传统方式获取数据 return; }
			 */
			// 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// 如果fileitem中封装的是普通输入项的数据
				if (item.isFormField()) {
					String name = item.getFieldName();
					// 解决普通输入项的数据的中文乱码问题
					String value = item.getString("UTF-8");
					// value = new String(value.getBytes("iso8859-1"),"UTF-8");
					System.out.println(name + "=" + value);
					if(name.equals("pname")) {
						product.setPname(value);
					}else if(name.equals("market_price")) {
						product.setMarket_price(Double.parseDouble(value));
						

					}else if(name.equals("shop_price")) {
						product.setShop_price(Double.parseDouble(value));
						
					}else if(name.equals("count")) {
						
						product.setCount(Integer.parseInt(value));
						

					}else if(name.equals("delivery_time")) {
						product.setDelivery_time(value);
						
					}else if(name.equals("summary")) {
						product.setSummary(value);
						
					

					}else if(name.equals("pdesc")) {
						product.setPdesc(value);
						

					}else if(name.equals("characteristics")) {
						product.setCharacteristics(value);
					}
					else if(name.equals("pflag")) {
						product.setPflag(Integer.valueOf(value));
					}
					else if(name.equals("characteristics")) {
						product.setCharacteristics(value);
					}
					else if(name.equals("is_new")) {
						product.setIs_new(Integer.valueOf(value));
					}
                    else if(name.equals("pimage")) {
                        product.setPimage(value);
                    }
                    else if(name.equals("pid")) {
                        product.setPid(value);
                    }
					
				} else {// 如果fileitem中封装的是上传文件
					// 得到上传的文件名称，
					 filename = item.getName();
					System.out.println(filename);

					if (filename == null || filename.trim().equals("")) {
						continue;
					} 
					// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如： c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
					// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
					filename = filename.substring(filename.lastIndexOf("\\") + 1);
					// 获取item中的上传文件的输入流
					InputStream in = item.getInputStream();
					// 创建一个文件输出流
					FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
					// 创建一个缓冲区
					byte buffer[] = new byte[1024];
					// 判断输入流中的数据是否已经读完的标识
					int len = 0;
					// 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
					while ((len = in.read(buffer)) > 0) {
						// 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
						out.write(buffer, 0, len);
					}
					// 关闭输入流
					in.close();
					// 关闭输出流
					out.close();
					// 删除处理文件上传时生成的临时文件
					item.delete();
					message = "文件上传成功！";
					System.out.println(message);
				}

			}
	
			//设置商品属性
			
			if (filename != null || !"".equals(filename.trim())) {
                product.setPimage(filename);
            }

			ProductService pdService = new ProductService();

			if(product.getPid() == null){
                pdService.saveProduct(product);
            }else{
                new ProductDao().delProduct(product.getPid());
                pdService.updateProduct(product);
            }

			//添加商品  更新首页商品信息
			ProductService productService = new ProductService();
			List<Product> newList = productService.findBySelected();
			List<Product> yesterdayListPro = productService.findYesterdayProduct();
			
			request.getSession().setAttribute("newList", newList);
			request.getSession().setAttribute("yesterdayListPro", yesterdayListPro);   
			request.setAttribute("msg", "商品添加成功");
			if(product.getPid()==null){
                request.getRequestDispatcher("/admin/addpro.jsp").forward(request, response);

            }else{
                request.getRequestDispatcher("/admin/editsuccess.jsp").forward(request, response);

            }

		} catch (Exception e) {
			e.printStackTrace();

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
