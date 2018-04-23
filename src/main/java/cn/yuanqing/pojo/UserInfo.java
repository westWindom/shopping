package cn.yuanqing.pojo;

import java.sql.Date;

/**
 * 用户信息实体类
 *
 * @author yq
 */
public class UserInfo {
    private int userId;//required
    private String regName;//required
    private String realName;
    private String password = null;//required
    private Date birthday;
    private String sex;
    private String email;//required
    private String address;
    private String logistics;
    private String identify;
    private String bankId;

    public String getLogistics() {
        return logistics;
    }

    public void setLogistics(String logistics) {
        this.logistics = logistics;
    }

    public UserInfo() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRegName() {
        return regName;
    }

    public void setRegName(String regName) {
        this.regName = regName;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIdentify() {
        return identify;
    }

    public void setIdentify(String identify) {
        this.identify = identify;
    }

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    @Override
    public String toString() {
        return "UserInfo [userId=" + userId + ", regName=" + regName + ", realName=" + realName + ", password=" + password
                + ", birthday=" + birthday + ", Sex=" + sex + ", email=" + email + ", address=" + address + ", logistics="
                + logistics + ", identify=" + identify + ", backId=" + bankId + "]";
    }
}
