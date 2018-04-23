package cn.yuanqing.pojo;

/**
 * 购物车实体类
 *
 * @author yq
 */
public class ShopcartInfo {
    private int id;
    private String name;
    private int num;
    private String buyer;
    private double goodsprice;

    public double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(double goodsprice) {
        this.goodsprice = goodsprice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }
}
