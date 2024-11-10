package com.Jutuan.servlet;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;
/**
 * 监听器，监听0点任务
 * @author Administrator
 *
 */
public class IndexListener implements ServletContextListener {
	private java.util.Timer timer = null;
	private static final long PERIOD_DAY = 24 * 60 * 60 * 1000;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//获取0点0分0秒的Date
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 1);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		Date date = calendar.getTime();
		if (date.before(new Date())) {
			date = this.addDay(date, 1);
		}
		timer = new java.util.Timer(true);
		sce.getServletContext().log("initializing  task...");
		//开启task  设置task的schedule
		timer.schedule(new IndexTask(sce.getServletContext()), PERIOD_DAY);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		sce.getServletContext().log("system core auto task ended.");
		timer.cancel();
	}
	//Date增加一日方法 
	public Date addDay(Date date, int num) {
		Calendar startDT = Calendar.getInstance();  
		startDT.setTime(date);
		startDT.add(Calendar.DAY_OF_MONTH, num);
		return startDT.getTime();
	}

}
