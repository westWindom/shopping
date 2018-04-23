package cn.yuanqing.dao;

import java.util.List;
import java.util.Map;

import cn.yuanqing.pojo.*;
import org.apache.ibatis.annotations.Param;


public interface UserDao {

    /**
     * 用户登录
     *
     * @param user 需要登录的用户信息，其中必须包含两个key,name和password。
     * @return 用户登录成功后的信息
     */
    UserInfo login(@Param("uname") String uname,@Param("upass") String upass);

    UserInfo isregister(String name);

    int insertUser(UserInfo userinfo);

    List<OrderlistInfo> order(String name);

    List<ShopcartInfo> queryshopcart_byuser(String buyer);

    List<CommentsInfo> querycomment_byname(String name);

    List<SystemMessageInfo> querysystemmessage(String name);

    UseraccountInfo queryuseraccount(String username);

    UserInfo querybyname(String name);

    GoodsInfo querygoods(Map map);

    int updataGoodsInfo(int num, String name);

    int changeIspay(double price, String name);

    int deaccount(@Param("account") Double account, @Param("username") String username);

    void updateaddress(String address, String name);

    ShopcartInfo queryshopcartnamebuyer(ShopcartInfo shopcart);

    int insertShopcart(ShopcartInfo shopcart);

    int updateShopcart(ShopcartInfo shopcart);

    void insertorderlist(@Param("goodsname") String goodsname, @Param("num") int ordernum, @Param("buyer") String buyer, @Param("price") double orderprice);

    void updateorderlistnum(@Param("ordernum") int ordernum, @Param("goodsname") String goodsname, @Param("buyer") String buyer, @Param("orderprice") double orderprice);

    OrderlistInfo queryorderBynamepricebuyer(String goodsname, String buyer, double price);

    public int deleteOrder(@Param("goodsname") String goodsname, @Param("buyer") String buyer);

    public void deleteshopcart(@Param("goodsname") String goodsname, @Param("buyer") String buyer);

    public OrderlistInfo queryorderBynamepricebuyernotpay(@Param("goodsname") String goodsname, @Param("buyer") String buyer, @Param("price") double price);

    public void insertorderlistnotpay(@Param("goodsname") String goodsname, @Param("buyer") String buyer, @Param("ordernum") int ordernum, @Param("orderprice") double orderprice);

    public void updatelogistics(@Param("logistics") String logistics, @Param("username") String username);

    public List<UserInfo> queryalluser();

    public int deuserbyname(UserInfo userinfo);

    public int upuserbyname(UserInfo userinfo);

    public int improveInfo(UserInfo userinfo);

    public List<CommentsInfo> allcomments();

    public List<UseraccountInfo> allaccount();

    public int upaccountbyname(UseraccountInfo useraccountinfo);

    public List<OrderlistInfo> allorder();

    public List<ShopcartInfo> allcart();

    public int upmessage(SystemMessageInfo systemmessage);

    int insertAccount(UseraccountInfo ua);
}
