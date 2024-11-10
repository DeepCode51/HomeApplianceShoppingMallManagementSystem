package com.Jutuan.bean;

import java.io.Serializable;
import java.util.Objects;

/**
 * 用于封装后端返回前端数据对象
 */
public class ResultInfo implements Serializable {
    private boolean flag;//后端返回结果正常为true，发生异常返回false
    private Object data;//后端返回结果数据对象
    private String errorMsg;//发生异常的错误消息
    private int role ;//检测登录人员1为管理员，2为用户

    public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	//无参构造方法
    public ResultInfo() {
    }
    public ResultInfo(boolean flag,int role) {
        this.flag = flag;
        this.role = role;
    }
    /**
     * 有参构造方法
     * @param flag
     * @param errorMsg
     */
    public ResultInfo(boolean flag, String errorMsg) {
        this.flag = flag;
        this.errorMsg = errorMsg;
    }
    /**
     * 有参构造方法
     * @param flag
     * @param data
     * @param errorMsg
     */
    public ResultInfo(boolean flag, Object data, String errorMsg) {
        this.flag = flag;
        this.data = data;
        this.errorMsg = errorMsg;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
