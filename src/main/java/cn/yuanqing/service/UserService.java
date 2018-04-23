package cn.yuanqing.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import cn.yuanqing.dao.GoodsDao;
import cn.yuanqing.dao.UserDao;
import cn.yuanqing.pojo.*;
import org.springframework.stereotype.Service;


@Service
public class UserService {

	@Resource
	private UserDao userDao;
	@Resource
	private GoodsDao goodsDao;
	
	public UserInfo userlogin(String uname,String upass){
		System.out.println("业务层");
		return userDao.login(uname,upass);
	}
	public UserInfo userisRegister(String name){
		return userDao.isregister(name);
	}
	/**
	 * 添加用户
	 * @param userinfo 用户信息
	 * @return 一个Int类型的值<br/>
	 * 			返回0表示，已经有人注册
	 */
	public int addUser(UserInfo userinfo){
		UserInfo userinfos= userDao.isregister(userinfo.getRegName());
		if(userinfos!=null){//如果已经有用户注册了这个名字，那么直接返回0
			return 0;
		}
		int res= userDao.insertUser(userinfo);
		if(res>0){
			//如果用户注册成功后，开通账户
			UseraccountInfo ua=new UseraccountInfo();
			ua.setUser(userinfo.getRegName());
			ua.setMoney(0);
			userDao.insertAccount(ua);
		}
		return res;
	}
	public List<OrderlistInfo> queryOrder(String name){
		List<OrderlistInfo> order=null;
		order= userDao.order(name);
		return order;
	}
	public List<ShopcartInfo> queryshopcart_byuser(String buyer){
		List<ShopcartInfo> shopcartinfo=null;
		shopcartinfo= userDao.queryshopcart_byuser(buyer);
		return shopcartinfo;
	}
	public List<CommentsInfo> querycomments_byname(String username){
		List<CommentsInfo> commentsinfo=null;
		try{
			commentsinfo= userDao.querycomment_byname(username);
		}catch(Exception e){
			commentsinfo=null;
		}
		return commentsinfo;
	}
	public List<SystemMessageInfo> querySystemMessagebyname(String username){
		List<SystemMessageInfo> systemmessage=null;
		try{
		systemmessage= userDao.querysystemmessage(username);
		}catch(Exception e){
			systemmessage=null;
		}
		return systemmessage;
	}
	public UseraccountInfo queryuseraccount(String username){
		UseraccountInfo useraccount=null;
		try{
			useraccount= userDao.queryuseraccount(username);
		}catch(Exception e){
			useraccount=null;
		}
		return useraccount;
	}
	public UserInfo selectbyname(UserInfo userinfo){
		UserInfo uinfo=null;
		try{
		 uinfo= userDao.querybyname(userinfo.getRegName());
		}catch(Exception e){
		}
		return uinfo;
	}
	public GoodsInfo querygoods(String goodsname,double price){
		GoodsInfo goodsinfo=new GoodsInfo();
		try{
		Map map=new HashMap();
		map.put("name", goodsname);
		map.put("price", price);
		goodsinfo = userDao.querygoods(map);
		}catch(Exception e){
			goodsinfo=null;
		}
		return goodsinfo;
	}
	public boolean immetranction(String name,int num,double goodsprice,String username){
		boolean status=false;
		//获得用户的资金余额
		
		double account=0;
		try{
		account=(userDao.queryuseraccount(username)).getMoney();
		}catch(Exception e){
			account=0;
		}
		if(account > goodsprice ){
		int goodsnum= userDao.updataGoodsInfo(num, name);//这里的数量是减掉之后的数量
		int ispaystate= userDao.changeIspay(goodsprice, name);
		if(goodsnum>0&&ispaystate>0){
			//扣除用户账号上的钱
			if((userDao.deaccount(goodsprice,username))>0){
				status=true;//扣除成功
			}else{
				status=false;//扣除失败
			}
		}else{
			status=false;//交易失败
		}
		}
		return status;
	}
	public void setaddress(String address,String username){
		userDao.updateaddress(address, username);
	}
	public ShopcartInfo queryshopcartnamebuyer(ShopcartInfo shopcart){
		ShopcartInfo myshopcart=new ShopcartInfo();
		try{
			myshopcart= userDao.queryshopcartnamebuyer(shopcart);
		}catch(Exception e){
			System.out.println(e);
			myshopcart=null;
		}
		return myshopcart;
	}
	public boolean insertshopcart(ShopcartInfo shopcart){
		 int res= userDao.insertShopcart(shopcart);
		 if(res>0){
			 return true;
		 }
		 return false;
	}
	public boolean updateshopcart(ShopcartInfo shopcart){
		int res= userDao.updateShopcart(shopcart);
		System.out.println(res);
		if(res>0){
			return true;
		}
		return false;
	}
	public GoodsInfo goodsdetail(String name){
		GoodsInfo goodsinfo=new GoodsInfo();
		try{
		goodsinfo= goodsDao.getgoods_byname(name);
		}catch(Exception e){
			e.printStackTrace();
			goodsinfo=null;
		}
		return goodsinfo;
	}
	public boolean deaccount(String username,double account){
		int res= userDao.deaccount(account,username);
		if(res>0){
			return true;
		}else{
			return false;
		}
	}
	public void insertorderlist(String goodsname,String buyer,int ordernum,double orderprice){
		userDao.insertorderlist(goodsname, ordernum,buyer,  orderprice);
	}
	public void updateorderlistnum(String goodsname,int ordernum,String buyer,double orderprice){
		userDao.updateorderlistnum(ordernum,goodsname ,buyer, orderprice);
	}
	public boolean updataGoodsInfo(int goodsnum,String goodsname){
		int res= userDao.updataGoodsInfo(goodsnum, goodsname);
		if(res>0){
			return true;
		}else{
			return false;
		}
	}
	public OrderlistInfo queryorderBynamepricebuyer(String goodsname,String buyer,double price){
		OrderlistInfo orderlist=new OrderlistInfo();
		try{
			orderlist= userDao.queryorderBynamepricebuyer(goodsname, buyer, price);
		}catch(Exception e){
			orderlist=null;
		}
		return orderlist;
	}
	public boolean delete_order(String goodsname,String buyer){
		boolean result=false;
		try{
		int res= userDao.deleteOrder(goodsname,buyer);
		if(res>0)
		result=true;
		}catch(Exception e){
			e.printStackTrace();
			result=false;
		}
		return result;
	}
	public boolean shopcart_immetranction(String username,String goodsname,double goodsprice,int num){
		boolean result=false;
		//扣除用户账户的钱
		if((userDao.deaccount((goodsprice*num),username))>0){
			//获得数据库中原先中orderlist还有多少数量，
			OrderlistInfo orderlist=new OrderlistInfo();
			try{
			orderlist= userDao.queryorderBynamepricebuyer(goodsname, username, goodsprice);
			}catch(Exception e){
				orderlist=null;
			}
			if(orderlist==null){
				//原来的orderlist中没有数据，重新插入数据
				userDao.insertorderlist(goodsname, num, username, goodsprice);
			}else{
				//原来的orderlist中有数据，向其中增加数量
				userDao.updateorderlistnum( num,goodsname, username, goodsprice);
			}
			//删除购物车里的商品信息
			userDao.deleteshopcart(goodsname, username);
			result=true;
		};
		
		return result;
	}
	public void shopcart_setorder(String goodsname,String buyer,int ordernum, double price){
		OrderlistInfo orderlist=new OrderlistInfo();
		try{
		orderlist= userDao.queryorderBynamepricebuyernotpay(goodsname, buyer, price);
		}catch(Exception e){
			orderlist=null;
		}
		if(orderlist==null){
			//重新插入数据
			userDao.insertorderlistnotpay(goodsname, buyer, ordernum, price);
		}else{
			//更新数量
			userDao.insertorderlistnotpay(goodsname, buyer, ordernum, price);
		}
		//删除购物车里的数据
		userDao.deleteshopcart(goodsname, buyer);
	}
	public void shopcart_delete(String goodsname,String username){
		userDao.deleteshopcart(goodsname, username);
	}
	public void setlogistics(String logistics,String username){
		userDao.updatelogistics(logistics, username);
	}
    public List<UserInfo> queryalluser(){
    	List<UserInfo> userinfo=null;
    	try{
    		userinfo= userDao.queryalluser();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    	return userinfo;
    }
    public boolean deuserbyname(UserInfo userinfo){
    	int res= userDao.deuserbyname(userinfo);
    	if(res>0)
    		return true;
    	return false;
    }
    public boolean upuserbyname(UserInfo userinfo){
    	int res = userDao.upuserbyname(userinfo);
    	if(res>0)
    		return true;
    	return false;
    }
	public boolean improveInfo(UserInfo userinfo){
		boolean result=false;
		try{
		userDao.improveInfo(userinfo);
		result=true;
		}catch(Exception e){
			e.printStackTrace();
			result=false;
		}
		return result;
	}
    public List<CommentsInfo> allcomments(){
    	return userDao.allcomments();
    }
    public List<UseraccountInfo> allaccount(){
    	return userDao.allaccount();
    }
    public UseraccountInfo selectaccountbyname(UseraccountInfo useraccount){
    	return userDao.queryuseraccount(useraccount.getUser());
    }
    public boolean upaccountbyname(UseraccountInfo useraccount){
    	int res= userDao.upaccountbyname(useraccount);
    	if(res>0)
    		return true;
    	return false;
    }
    public List<OrderlistInfo> allorder(){
    	return userDao.allorder();
    }
    public List<ShopcartInfo> allcart(){
    	return userDao.allcart();
    }
    public boolean upmessage(SystemMessageInfo systemmessage){
    	int res= userDao.upmessage(systemmessage);
    	if(res>0)
    		return true;
    	return false;
    }
}
