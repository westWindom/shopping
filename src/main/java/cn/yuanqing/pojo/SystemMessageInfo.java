package cn.yuanqing.pojo;

import java.sql.Timestamp;

/**
 * 系统消息实体类
 * @author yq
 *
 */
public class SystemMessageInfo {

	private int id;
	private String accepter;
	private String contents;
	private Timestamp time;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccepter() {
		return accepter;
	}
	public void setAccepter(String accepter) {
		this.accepter = accepter;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
}
