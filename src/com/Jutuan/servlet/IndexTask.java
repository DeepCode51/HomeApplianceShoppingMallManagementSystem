package com.Jutuan.servlet;

import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import com.Jutuan.bean.Product;
import com.Jutuan.service.ProductService;

import com.Jutuan.bean.Product;
/**
 * 首页刷新商品任务
 * @author Administrator
 *
 */

public class IndexTask extends TimerTask {
	private ServletContext sc = null;
	private static boolean running = false;

	// constructor method of CCoreTask
	public IndexTask(ServletContext sc) {
		this.sc = sc;
	}

	@Override
	public void run() {
		if (!running) {
			running = true;
			this.sc.log("start running IndexTask...");
			//启动定时任务，0点刷新商品精选，昨日商品
			doTask();
			running = false;
			this.sc.log("IndexTask runned.");
		}
	}

	private void doTask() {
		//先移除，再设置全局域对象
		sc.removeAttribute("newList");
		sc.removeAttribute("yesterdayListPro");
		sc.removeAttribute("newListOther");
		sc.removeAttribute("yesterdayListProOther");
		ProductService productService = new ProductService();

		List<Product> newList = productService.findBySelected();
		List<Product> yesterdayListPro = productService.findYesterdayProduct();

		sc.setAttribute("newList", newList);
		sc.setAttribute("yesterdayListPro", yesterdayListPro);

		sc.setAttribute("newListOther", 6 - newList.size());

		sc.setAttribute("yesterdayListProOther", 6 - yesterdayListPro.size());
	}
}
