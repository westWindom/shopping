package cn.yuanqing.pojo;

/**
 * �û�����ʵ����
 * @author yq
 *
 */
public class OrderlistInfo {
	private int orderid;
	private String goodsName;
	private int orderNum;
	private String ispay;
	private String buyer;
	private double orderprice;
	public double getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(double orderprice) {
		this.orderprice = orderprice;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public String getIspay() {
		return ispay;
	}
	public void setIspay(String ispay) {
		this.ispay = ispay;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	@Override
	public String toString() {
		return "OrderlistInfo [orderid=" + orderid + ", goodsName=" + goodsName + ", orderNum=" + orderNum + ", ispay="
				+ ispay + ", buyer=" + buyer + ", orderprice=" + orderprice + "]";
	}

}
