package com.Jutuan.service;

import java.util.List;

import com.Jutuan.bean.Users;
import com.Jutuan.dao.AddUserDao;
import com.Jutuan.dao.CheckDao;
import com.Jutuan.dao.CheckRegisterDao;
import com.Jutuan.dao.GetUserDao;

public class UserService {

	public int LoginInfor(String username, String passowrd) {
		// 实例化LoginDao对象
		CheckDao checkDao = new CheckDao();
		// 判断账号或者密码是否为空或空格
		if (username == null || "".equals(username.trim()) || passowrd == null || "".equals(passowrd.trim())) {
			return 0;
		} else {
			return checkDao.LoginInfor(username, passowrd);
		}
	}

	/**
	 * 调用AddUserDao
	 */
	public void AddUser(String username, String password, String email, String name, String telephone, String sex,
			String birthday) {
		// 实例化Users对象
		Users user = new Users();
		// 实例化AddUserDao
		AddUserDao addUserDao = new AddUserDao();
		// 设置user的值
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setName(name);
		user.setTelephone(telephone);
		user.setSex(sex);
		user.setBirthday(birthday);
		user.setRole(2);
		// 调用AddUser()方法
		addUserDao.AddUser(user);
	}

	/**
	 * 调用GetUserNameDao
	 */
	public List<Users> GetUserName(String username) {
		// 实例化GetUserNameDao
		GetUserDao getUserNameDao = new GetUserDao();

		// 调用AddUser()方法
		return getUserNameDao.GetUserName(username);
	}

	public int CheckRegister(String username) {
		// 1.根据用户名查询用户对象
		CheckRegisterDao checkRegisterDao = new CheckRegisterDao();
		int a = checkRegisterDao.CheckRegister(username);
		// 判断u是否为null
		if (a != 0) {
			// 用户名存在，注册失败
			return a;
		}
		return a;
	}

	public void updateAddress(String username, List<String> list) {
		// TODO Auto-generated method stub
		GetUserDao getUserNameDao = new GetUserDao();

		String address = "";
		for (String str : list) {
			address =address+str+"###";
		}
		;
   
		getUserNameDao.updateAddress(username, address);
	}
}
