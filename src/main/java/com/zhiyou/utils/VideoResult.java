package com.zhiyou.utils;

import java.io.Serializable;

/**
 * video�Զ�����Ӧ�ṹ
 * @author ��ˬ
 *
 */
public class VideoResult implements Serializable {
	
	//��Ӧҵ��״̬
	private Integer status;
	
	//��Ӧ��Ϣ
	private String msg;
	
	//��Ӧ������
	private Object data;

	
	/**
	 * ����һ��VideoResult
	 * @param status
	 * @param msg
	 * @param data
	 * @return
	 */
	public static VideoResult build(Integer status, String msg, Object data){
		
		return new VideoResult(status, msg, data);
	}
	
	/**
	 *  ���سɹ�״̬������
	 * @param data
	 * @return
	 */
	public static VideoResult success(Object data){
		
		return new VideoResult(data);
		
	}
	
	/**
	 * ����һ�������ݵĳɹ�״̬
	 * @return
	 */
	public static VideoResult success(){
		return new VideoResult(null);
	}
	
	
	
	//������get/set�����췽��,���ÿ���
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
	 * ֻ�����ݵĹ��췽��
	 * @param data
	 */
	public VideoResult(Object data){
		
		this.status = 200;
		
		this.msg = "OK";
		
		this.data = data;
		
		
	}
	
	
	
	
	
	
	
	

}
