package cn.yuanqing.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.yuanqing.pojo.*;
import cn.yuanqing.service.GoodsService;
import cn.yuanqing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;


/**
 * 该类主要处理和用户相关的请求
 * @author yq
 *
 */
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	GoodsService goodsservice;
	
	/**
	 * 处理用户的登录功能
	 * @param uname 用户名
	 * @param upass 密码
	 * @param value 验证码的值
	 * @param session HttpSession对象
	 * @return 一个JSON字符串，<br/>
	 * 			如果验证码错误,返回{"result",-1}<br/>
	 * 			如果登录成功,返回{"result",1}<br/>
	 * 			如果登录失败，非验证码的原因，返回{"result",0}
	 */
	@RequestMapping(value="/login.htgo")
	@ResponseBody
	public Object userLogin(String uname,String upass,String value,HttpSession session){
		Map<String,String> map2=new HashMap<String,String>();
		
    	String valueCode=(String)session.getAttribute("strCode");
    	if(valueCode!=null){
    		if(!valueCode.equals(value)){
    			map2.put("result", "-1");//-1代表验证码错误
    			return map2;
    		}
    	}
		
//		Map<String,String> map=new HashMap<String,String>();
//		map.put("name", uname);
//		map.put("password", upass);
		UserInfo user = userService.userlogin(uname,upass);
        System.out.println(user);
		map2.put("uname",uname);
		if(user!=null){
			map2.put("result", "1");//1代表登录成功
			//将信息放到session对话中
			session.setAttribute("userName", uname);
			//查询购物车的数量，并且将结果放入到session中的shopcartnum变量中
			getShopcartNumAndWirteToSession(session);
			
		}else{
			map2.put("result", "0");//0代表登录失败
		}

        String s = new Gson().toJson(map2);
        System.out.println(s);

		System.out.println((10&1)+(10|1)+(6>>3)+(5<<3));
        return map2;
	}
	
	/**
	 * 表单提交后，进行用户注册处理。
	 * @param userinfo 用户信息
	 * @param model Model对象
	 * @param session HttpSession对象
	 * @return 一个Integer类型的对象<br/>
	 * 			如果为0,注册失败
	 */
	@RequestMapping(value="register.htgo")
	@ResponseBody
	public Integer register(UserInfo userinfo,Model model,HttpSession session){

		return userService.addUser(userinfo);
	}
	/**
	 * 判断该用户名是否已经注册
	 * @param name
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="isregist.htgo")
	@ResponseBody
	public Object isRegist(String name) throws UnsupportedEncodingException{
		name=new String(name.getBytes("iso-8859-1"),"utf-8");
		UserInfo uinfo=userService.userisRegister(name);
		if(uinfo!=null){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 用户中心
	 * @param session
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping(value="personalCenter.htgo")
	public String userCentercon(HttpSession session,String type,Model model){
		String userName=(String)session.getAttribute("userName");
		if(userName!=null){//登录
			String page="userCenter/";
			if(type==null){type="null";}//如果没有type参数就把type赋值为字符串“null”.
			switch(type){//switch匹配字符串至少需要 Java SE 7 。本jdk是8.5.9.
			case "null"://用户中心
				page=page.concat("welcome.jsp");
				break;
			case "order"://我的订单
				page=page.concat("order.htgo");
				break;
			case "shopcart"://我的购物车
				page=page.concat("shopcart.htgo");
				break;
			case "comments"://我的评论
				page=page.concat("comments.htgo");
				break;
			case "systemmessage"://系统消息
				page=page.concat("systemmessage.htgo");
				break;
			case "account"://账户余额
				page=page.concat("account.htgo");
				break;
			case "myinfo"://个人资料
				page=page.concat("myinfo.htgo");
				break;
			case "acceptAddress"://收件地址
				page=page.concat("acceptAddress.htgo");
				break;
			case "logistics"://物流选择
				page=page.concat("logistics.htgo");
				break;
			case "logOff"://注销登录
				page=page.concat("logOff.htgo");
				break;
			default://未知...
				break;
			}
			model.addAttribute("page", page);
			return "personalCenter";
		}else{//未登录
			return "toLogin";
		}
	}
	/**
	 * 用户订单查询
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="userCenter/order.htgo")
	public String order(Integer current,HttpSession session,Model model){
		List<OrderlistInfo> orderlist=null;
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 5);
		orderlist=userService.queryOrder((String)session.getAttribute("userName"));
		model.addAttribute("orderlist",orderlist);
		model.addAttribute("total",page.getTotal());
		model.addAttribute("current", current);
		return "order";
	}
	
	
	/**
	 * 购物车
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="userCenter/shopcart.htgo")
	public String shopcart(Integer current,HttpSession session,Model model){
		if(current == null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 5);
		List<ShopcartInfo> shopcart=null;
		shopcart=userService.queryshopcart_byuser((String)session.getAttribute("userName"));
		model.addAttribute("shopcart", shopcart);
		model.addAttribute("total",page.getTotal());
		model.addAttribute("current", current);
		return "shopcart";
	}
	/**
	 * 评论
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="userCenter/comments.htgo")
	public String comments(Integer current,HttpSession session,Model model){
		if(current == null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 5);
		List<CommentsInfo> comments=null;
		comments=userService.querycomments_byname((String)session.getAttribute("userName"));
		model.addAttribute("comments", comments);
		model.addAttribute("total",page.getTotal());
		model.addAttribute("current", current);
		return "comments";
	}
	/**
	 * 显示该用户的系统消息<br/>
	 * 采用分页显示，每一页的数量为5.<br/>
	 * 如果current为null，那么取第一页的数据
	 * @param current 当前页
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="userCenter/systemmessage.htgo")
	public String systemmessage(Integer current,HttpSession session,Model model){
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 5);
		List<SystemMessageInfo> systemmessage=null;
		systemmessage=userService.querySystemMessagebyname((String)session.getAttribute("userName"));
		model.addAttribute("systemmessage", systemmessage);
		model.addAttribute("total",page.getTotal());
		model.addAttribute("current", current);
		
		return "systemmessage";
	}
	/**
	 * 显示用户的账户的信息
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的字符串，表示url.
	 */
	@RequestMapping(value="userCenter/account.htgo")
	public String account(HttpSession session,Model model){
		UseraccountInfo useraccount=new UseraccountInfo();
		useraccount=userService.queryuseraccount((String)session.getAttribute("userName"));
		model.addAttribute("useraccount", useraccount);
		return "account";
	}
	/**
	 * 显示用户的个人信息
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 返回一个String类型的数据，表示url.
	 */
	@RequestMapping(value="userCenter/myinfo.htgo")
	public String myinfo(HttpSession session,Model model){
		UserInfo userinfo=new UserInfo();
		String username=(String)session.getAttribute("userName");
		userinfo.setRegName(username);
		userinfo=userService.selectbyname(userinfo);
		model.addAttribute("userinfo", userinfo);
		return "myinfo";
	}
	/**
	 * 用户的收件地址<br/>
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url。
	 */
	@RequestMapping(value="userCenter/acceptAddress.htgo")
	public String acceptAddress(HttpSession session,Model model){
		UserInfo userinfo=new UserInfo();
		userinfo.setRegName((String)session.getAttribute("userName"));
		userinfo=userService.selectbyname(userinfo);
		model.addAttribute("address", userinfo.getAddress());
		return "acceptAddress";
	}
	/**
	 * 物流信息
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="userCenter/logistics.htgo")
	public String logistics(HttpSession session,Model model){
		UserInfo userinfo=new UserInfo();
		userinfo.setRegName((String)session.getAttribute("userName"));
		userinfo=userService.selectbyname(userinfo);
		model.addAttribute("logistics", userinfo.getLogistics());
		return "logistics";
	}
	/**
	 * 注销登录
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="logOff.htgo")
	public String logOff(HttpSession session,Model model){
		session.removeAttribute("userName");
		model.addAttribute("logoff", "退出登录");
		return "toLogin";
	}
	/**
	 * 用户下单处理
	 * @param session HttpSession对象
	 * @param goodsname 商品名称
	 * @param goodsnum 商品数量
	 * @param goodsprice 商品价格
	 * @param model Model对象
	 * @return 一个String类型的数据
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="orderbookout.htgo")
	public String order_bookout(HttpSession session,String goodsname,int goodsnum,double goodsprice,Model model) throws UnsupportedEncodingException{
		goodsname=new String(goodsname.getBytes("iso-8859-1"),"utf-8");
		//查询用户是否设置了快递，和收件地址
		UserInfo userinfo=new UserInfo();
		userinfo.setRegName((String)session.getAttribute("userName"));
		userinfo=userService.selectbyname(userinfo);
		if(userinfo.getLogistics()==null){
			model.addAttribute("logistics", "您还没有设置物流");
			return "logisticsResultStatus";
		}
		if(userinfo.getAddress()==null){
			model.addAttribute("address", "您还没有设置收件地址");
			return "addressResultStatus";
		}
		
		//查询商品是否存，数量是否购，价格是否没变
		GoodsInfo goodsinfo=new GoodsInfo();
		goodsinfo=userService.querygoods(goodsname, goodsprice);
		if(goodsinfo==null){//商品已不存在
			model.addAttribute("info", "商品已经下架");
			return "tradeException";
		}
		if(goodsinfo.getGoodsNum()<goodsnum||goodsinfo.getGoodsNum()<=0){//商品数量不够
			model.addAttribute("info", "商品数量不足");
			return "tradeException";
		}
		//改变goodsinfo表中的商品数量、改变orderlist中的成交状态、改变账户余额
		boolean trancstate=userService.immetranction(goodsname, (goodsinfo.getGoodsNum()-goodsnum),goodsprice,(String)session.getAttribute("userName"));
		if(trancstate){
			model.addAttribute("info", "交易成功");
			return "tradeSuccessfully";
		}else{
			model.addAttribute("info", "交易失败,请检查账户余额");
			return "tradeUnsuccessfully";
		}
	}
	/**
	 * 添加到购物车
	 * @param userGoodsLoc 用户的物流地址
	 * @param goodsname 商品名称
	 * @param goodsnum 商品数量
	 * @param url 
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="addToShaopcart.htgo")
	@ResponseBody
	public Object addToShopcart(String userGoodsLoc,String goodsname,Integer goodsnum,String url,HttpSession session,Model model){
		System.out.println("加入购物车");
		model.addAttribute("url", url);
		
		session.setAttribute("userGoodsLoc", userGoodsLoc);
		//userService.setaddress(userGoodsLoc, (String)session.getAttribute("userName"));//将地址更新到数据库
		Map map=new HashMap();
		//判断是否登录
		String username=(String)session.getAttribute("userName");
		if(username==null){
			//用户还未登录
			map.put("result", "你还未登录");
			
			return map;
		}
		
		ShopcartInfo shopcartcheck=new ShopcartInfo();
		shopcartcheck.setBuyer((String)session.getAttribute("userName"));
		shopcartcheck.setName(goodsname);
		shopcartcheck=userService.queryshopcartnamebuyer(shopcartcheck);//查询该用户在购物车中是否有相同的产品
		if(shopcartcheck==null){
			//原本没有数据
			ShopcartInfo shopcartinsert=new ShopcartInfo();
			shopcartinsert.setBuyer((String)session.getAttribute("userName"));
			shopcartinsert.setName(goodsname);
			if(goodsnum==null){
				goodsnum=0;
			}
			shopcartinsert.setNum(goodsnum);
			if(userService.insertshopcart(shopcartinsert)){
				//添加成功
				model.addAttribute("info", "添加成功");
				map.put("result", "添加成功");
				
				//添加成功后，将购物车的数量添加到session中去
				getShopcartNumAndWirteToSession(session);
				
				return map;
			}else{
				//添加失败
				model.addAttribute("info", "添加失败");
				map.put("result", "添加失败");
				return map;
			}
		}else{
			//有数据，只需要增加数量
			ShopcartInfo shopcartinsert=new ShopcartInfo();
			shopcartinsert.setBuyer((String)session.getAttribute("userName"));
			shopcartinsert.setName(goodsname);
			shopcartinsert.setNum(goodsnum);
			if(userService.updateshopcart(shopcartinsert)){
				//增加成功
				model.addAttribute("info", "添加成功");
				map.put("result", "添加成功");
				return new Gson().toJson(map);
			}else{
				//增加失败
				model.addAttribute("info", "添加失败");
				map.put("result", "添加成功");
				return new Gson().toJson(map);
			}
		}
	}
	/**
	 * 立刻购买
	 * @param userGoodsLoc 用户的商品地址
	 * @param goodsname 商品名称
	 * @param goodsnum 商品数量
	 * @param url 
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="buynow.htgo")
	@ResponseBody
	public Object buynow(String userGoodsLoc,String goodsname,Integer goodsnum,String url,HttpSession session,Model model){
		System.out.println("立即购买");
		model.addAttribute("url", url);
		//判断是否登录
		String username=(String)session.getAttribute("userName");
		Map map=new HashMap();
		if(username==null){
			//用户还未登录
			map.put("result", "你还未登录");
			return map;
		}
		
		session.setAttribute("userGoodsLoc", userGoodsLoc);
	//	userService.setaddress(userGoodsLoc, (String)session.getAttribute("userName"));//将地址更新到数据库
		
		//查询用户是否设置了快递，和收件地址
		UserInfo userinfo=new UserInfo();
		userinfo.setRegName((String)session.getAttribute("userName"));
		userinfo=userService.selectbyname(userinfo);
		if(userinfo.getLogistics()==null){
			model.addAttribute("logistics", "您还没有设置物流");
			map.put("result", "你还未设置物流信息");
			return map;
		}
		if(userinfo.getAddress()==null){
			model.addAttribute("address", "您还没有设置收件地址");
			map.put("result", "您还没有设置收件地址");
			return map;
		}
		
		//查询商品库里面的商品信息
		GoodsInfo goodsinfo=new GoodsInfo();
		goodsinfo=userService.goodsdetail(goodsname);
		if(goodsinfo==null){
			model.addAttribute("info", "该商品已下架");
			map.put("result", "该商品已下架");
			return map;
		}
		if(goodsinfo.getGoodsNum()<goodsnum){
			model.addAttribute("info", "商品数量不够");
			map.put("result", "商品数量不够");
			return map;
		}
		
		//判断用户的账户余额是否够
		UseraccountInfo useraccount=new UseraccountInfo();
		useraccount=userService.queryuseraccount(username);
		if(useraccount==null){
			model.addAttribute("info", "您还没有充值过！赶快去充值开通账户吧");
			map.put("result", "您还没有充值过！赶快去充值开通账户吧");
			return map;
		}
		
		if(useraccount.getMoney()<(goodsnum*goodsinfo.getGoodsprice())){
			model.addAttribute("info", "账户余额不足");
			map.put("result", "账户余额不足");
			return map;
		}else{
		//扣除账户余额
			if(userService.deaccount(username,(goodsnum*goodsinfo.getGoodsprice()))){
				//扣除成功
				//判断数据库里是否已经有订单了
				OrderlistInfo orderlist=new OrderlistInfo();
				orderlist=userService.queryorderBynamepricebuyer(goodsname, username, goodsinfo.getGoodsprice());
				boolean orderlistcheck=false;//true表示无订单，false表示有订单
				if(orderlist==null){
					orderlistcheck=true;
				}else{
					orderlistcheck=false;
				}
				if(orderlistcheck){
					//添加订单
					userService.insertorderlist(goodsname, username, goodsnum, goodsinfo.getGoodsprice());
				}else{
					//表示有订单
					userService.updateorderlistnum(goodsname, goodsnum, username, goodsinfo.getGoodsprice());
				}
					//更新商品数据库里的商品数量
				if(userService.updataGoodsInfo((goodsinfo.getGoodsNum()-goodsnum), goodsname)){
					model.addAttribute("info", "操作成功");
					map.put("result", "操作成功");
					//购物成功后，调用getShopcartNumAndWirteToSession更新session中购物车的数量
					getShopcartNumAndWirteToSession(session);
					
					return new Gson().toJson(map);
				}else{
					model.addAttribute("info", "操作失败");
					map.put("result", "操作失败");
					return new Gson().toJson(map);
				}
			}else{
				model.addAttribute("info", "操作失败");
				map.put("result", "操作失败");
				return new Gson().toJson(map);
			}
		}
	}
	/**
	 * 删除订单
	 * @param goodsname 商品名称
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @param response HttpServeltResponse对象
	 * @throws IOException 
	 */
	@RequestMapping(value="deleteorder.htgo")
	public void delete_order(String goodsname,HttpSession session,Model model,HttpServletResponse response) throws IOException{
		boolean result=false;
		goodsname=new String(goodsname.getBytes("iso-8859-1"),"utf-8");
		result=userService.delete_order(goodsname, (String)session.getAttribute("userName"));
		if(result==true){
			model.addAttribute("info", "操作成功");
			response.sendRedirect("personalCenter.htgo?type=order");
		}else{
			model.addAttribute("info", "操作失败，请联系管理员");
			response.sendRedirect("personalCenter.htgo?type=order");
		}
	}
	/**
	 * 购物车下单处理
	 * @param goodsname 商品名称
	 * @param goodsnum 商品数量
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="shopcartbookout.htgo")
	public String shopcart_bookout(String goodsname,int goodsnum,HttpSession session,Model model) throws UnsupportedEncodingException{
		//查询用户是否设置了快递，和收件地址
		UserInfo userinfo=new UserInfo();
		goodsname=new String(goodsname.getBytes("iso-8859-1"),"utf-8");
		userinfo.setRegName((String)session.getAttribute("userName"));
		userinfo=userService.selectbyname(userinfo);
		if(userinfo.getLogistics()==null){
			model.addAttribute("logistics", "您还没有设置物流");
			return "logisticsResultStatus";
		}
		if(userinfo.getAddress()==null){
			model.addAttribute("address", "您还没有设置收件地址");
			return "addressResultStatus";
		}
		
		//查询用户是否有资金账户
		
		//比较商品数量是否够
		GoodsInfo goodsinfo=new GoodsInfo();
		goodsinfo=goodsservice.goodsdetail(goodsname);
		if(goodsinfo.getGoodsNum()<goodsnum){
			model.addAttribute("shopcartinof", "商品数量不够，请联系管理员");
			return "shopcartResultStatus";
		}
		//比较用户账户余额是否够
		UseraccountInfo useraccount=new UseraccountInfo();
		String username=(String)session.getAttribute("userName");
		useraccount=userService.queryuseraccount(username);
		double money=0;
		try{
			money=useraccount.getMoney();//用户没有账户
		}catch(Exception e){
			money=0;
		}
		if(money<(goodsinfo.getGoodsprice()*goodsnum)){
			model.addAttribute("shopcartinof", "您的余额不足，请及时充值");
			return "shopcartResultStatus";
		}
		boolean result=userService.shopcart_immetranction(username, goodsname, goodsinfo.getGoodsprice(), goodsnum);
		if(result){
			model.addAttribute("shopcartinof", "交易成功");
			//交易成功后，更新session中购物车的数量
			getShopcartNumAndWirteToSession(session);
			return "shopcartResultStatus";
		}else{
			model.addAttribute("shopcartinof", "交易失败");
			return "shopcartResultStatus";
		}	
	}	
	/**
	 * 用户对购物车进行下单
	 * @param goodsname 商品名称
	 * @param goodsnum 商品数量
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="shopcartsetorder.htgo")
	public String Shopcart_setorder(String goodsname,int goodsnum,HttpSession session,Model model) throws UnsupportedEncodingException{
		goodsname=new String(goodsname.getBytes("iso-8859-1"),"utf-8");
		GoodsInfo goodsinfo=new GoodsInfo();
		goodsinfo=goodsservice.goodsdetail(goodsname);
		
		userService.shopcart_setorder(goodsname, (String)session.getAttribute("userName"), goodsnum, goodsinfo.getGoodsprice());
		model.addAttribute("shopcartinof", "下单成功");
		//下单成功后，更新session中购物车的数量
		getShopcartNumAndWirteToSession(session);
		return "shopcartResultStatus";
	}
	
	/**
	 * 删除购物车信息
	 * @param goodsname 商品名称
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="shopcartdelete.htgo")
	public String Shopcartdelete(String goodsname,HttpSession session,Model model) throws UnsupportedEncodingException{
		goodsname=new String(goodsname.getBytes("iso-8859-1"),"utf-8");
		userService.shopcart_delete(goodsname, (String)session.getAttribute("userName"));
		model.addAttribute("shopcartinof", "操作成功");
		//删除成功后，更新session中购物车的数量
		getShopcartNumAndWirteToSession(session);
		return "shopcartResultStatus";
	}
	/**
	 * 商品地址更新
	 * @param userGoodsLoc 用户地址
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="addressupdate.htgo")
	public String personalAddressUpdate(String userGoodsLoc,HttpSession session,Model model) throws UnsupportedEncodingException{
		userGoodsLoc=new String(userGoodsLoc.getBytes("iso-8859-1"),"utf-8");
		session.setAttribute("userGoodsLoc", userGoodsLoc);
		userService.setaddress(userGoodsLoc, (String)session.getAttribute("userName"));//将地址更新到数据库
		model.addAttribute("address", "地址更新成功");
		return "addressResultStatus";
	}
	/**
	 * 更新物流地址
	 * @param logistics 需要更新的物流地址
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="logisticsupdate.htgo")
	public String updatelogistics(String logistics,Model model,HttpSession session){
		userService.setlogistics(logistics, (String)session.getAttribute("userName"));
		model.addAttribute("logistics", "物流更新成功");
		return "logisticsResultStatus";
	}
	/**
	 * personalCenter里的地址框失焦后的处理程序
	 * @param userGoodsLoc 物流地址
	 * @param type 类型
	 * @param session
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="personalcenterloc.htgo")
	public String personalGetGoodsLoc(String userGoodsLoc,String type,HttpSession session,Model model) throws UnsupportedEncodingException{
		userGoodsLoc=new String(userGoodsLoc.getBytes("iso-8859-1"),"utf-8");
		session.setAttribute("userGoodsLoc", userGoodsLoc);
		userService.setaddress(userGoodsLoc, (String)session.getAttribute("userName"));//将地址更新到数据库
		model.addAttribute("page", type);
		return "personalCenter";
	}
	
	@InitBinder
	public void initBinder(ServletRequestDataBinder bin){
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	         CustomDateEditor cust = new CustomDateEditor(sdf,true);
	         bin.registerCustomEditor(Date.class,cust);
	}
	/**
	 * 修改个人信息
	 * @param realname 真实姓名
	 * @param birthday 生日
	 * @param sex 性别
	 * @param identify 身份证
	 * @param backid 银行卡
	 * @param session 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="modifymyinfo.htgo")
	public String modify_myInfo(String realname,Date birthday,String sex,String identify,String backid,HttpSession session,Model model){		
		UserInfo userinfo=new UserInfo();
		userinfo.setRegName((String)session.getAttribute("userName"));
		userinfo.setRealName(realname);
		userinfo.setBirthday(birthday);
		userinfo.setSex(sex);
		userinfo.setIdentify(identify);
		userinfo.setBankId(backid);
		
		boolean result=userService.improveInfo(userinfo);
		if(result==true){
			model.addAttribute("info", "操作成功");
		}else{
			model.addAttribute("info", "操作失败，请检查数据是否符合规范");
		}
		return "myinfoResultStatus";
	}
	/**
	 * 该方法可以获得当前用户的购物车的数量，并且把数量添加到Sessiod对象
	 * @param session
	 */
	public void getShopcartNumAndWirteToSession(HttpSession session){
		session.setAttribute("shopcartnum", userService.queryshopcart_byuser((String)session.getAttribute("userName")).size());
	}
}
