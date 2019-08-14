package com.zhiyou.utils;

/**
 * video自定义响应结构
 * @author 李爽
 *
 */
public class VideoResult {
	
	//响应业务状态
	private Integer status;
	
	//响应消息
	private String msg;
	
	//响应的数据
	private Object data;

	
	/**
	 * 创建一个VideoResult
	 * @param status
	 * @param msg
	 * @param data
	 * @return
	 */
	public static VideoResult build(Integer status, String msg, Object data){
		
		return new VideoResult(status, msg, data);
	}
	
	/**
	 *  返回成功状态及数据
	 * @param data
	 * @return
	 */
	public static VideoResult success(Object data){
		
		return new VideoResult(data);
		
	}
	
	/**
	 * 返回一个无数据的成功状态
	 * @return
	 */
	public static VideoResult success(){
		return new VideoResult(null);
	}
	
	
	
	//下面是get/set及构造方法,不用看了
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public VideoResult(Integer status, String msg, Object data) {
		super();
		this.status = status;
		this.msg = msg;
		this.data = data;
	}

	public VideoResult() {
	
	}
	
	
	/**
	 * 只传数据的构造方法
	 * @param data
	 */
	public VideoResult(Object data){
		
		this.status = 200;
		
		this.msg = "OK";
		
		this.data = data;
		
		
	}
	
	
	
	
	
	
	
	

}
