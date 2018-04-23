package cn.yuanqing.pojo;

/**
 * 用户账户实体类
 *
 * @author yq
 */
public class UseraccountInfo {
    private int id;
    private String user;
    private double money;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }
}
