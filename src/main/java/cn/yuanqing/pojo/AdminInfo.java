package cn.yuanqing.pojo;


/**
 * 管理员实体类
 * @author yq
 *
 */
public class AdminInfo {
	/**
	 * 管理员名称
	 */
	private String adminName;
	/**
	 * 管理员密码
	 */
	private String adminPsw;
	
	/**
	 * 获得管理员的名称
	 * @return String类型的数据，表示管理员的名称
	 */
	public String getAdminName() {
		return adminName;
	}
	/**
	 * 设置管理员的名称
	 * @param adminName 管理员的名称
	 */
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	/**
	 * 获得管理员的密码
	 * @return String类型的数据，表示管理员的密码
	 */
	public String getAdminPsw() {
		return adminPsw;
	}
	/**
	 * 设置管理员的密码
	 * @param adminPsw 需要设置的密码
	 */
	public void setAdminPsw(String adminPsw) {
		this.adminPsw = adminPsw;
	}
}
