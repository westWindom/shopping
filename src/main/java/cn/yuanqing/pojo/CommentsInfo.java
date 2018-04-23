package cn.yuanqing.pojo;

import java.sql.Timestamp;

/**
 * 评论信息实体类
 * @author yq
 *
 */
public class CommentsInfo {
	/**
	 * id
	 */
	private int id;
	/**
	 * 评论者
	 */
	private String userName;
	/**
	 * 评论商品
	 */
	private String goods;
	/**
	 * 评论内容
	 */
	private String comments;
	/**
	 * 评论时间
	 */
	private Timestamp time;
	/**
	 * 评论级别
	 */
	private String grade;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
