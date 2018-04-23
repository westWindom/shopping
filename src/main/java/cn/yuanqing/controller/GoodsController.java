package cn.yuanqing.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.yuanqing.pojo.CommentsInfo;
import cn.yuanqing.pojo.GoodsInfo;
import cn.yuanqing.pojo.GoodsMainInfo;
import cn.yuanqing.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsservice;
	
	/**
	 *从数据库中调用相应的广告商品数据
	 * 
	 * @param model 一个Model对象
	 * @return 一个String类型的数据，表示url.
	 */
	@RequestMapping(value="mainhandler.htgo")
	public String goodsSelect(Model model){
		List<GoodsMainInfo> creenadinfo= goodsservice.screenad();//大屏幕的广告，其中前六个为滚动广告，后两个为固定广告
		List<GoodsMainInfo> recommend=goodsservice.recommend();	//推荐商品
		List<GoodsMainInfo> newgoods=goodsservice.newgoods();//新品上市
		List<GoodsMainInfo> popular=goodsservice.popular();//热门商品
		model.addAttribute("creenadinfo", creenadinfo);
		model.addAttribute("recommend", recommend);
		model.addAttribute("newgoods", newgoods);
		model.addAttribute("popular", popular);
		
		return "mainhandler";
	}
	/**
	 * 商品陈列<br/>
	 * 采用分页显示，如果current为null<br/>
	 * 那么取出第一页的数据
	 * @param category 商品的类型
	 * @param current 当前页
	 * @param model 一个Model对象
	 * @return 一个String类型的数据，表示url.
	 */
	@RequestMapping(value="goodsdisplay.htgo")
	public String GoodsDisplay(String category,Integer current,Model model){
		System.out.println("商品陈列");
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 10);
		
		if(category==null||"undefined".equals(category)){
			category="0";
		}
		int goodscategory=Integer.valueOf(category);
		
		List<GoodsInfo> goodsinfo=null;

		if(goodscategory!=1&&goodscategory!=2&&goodscategory!=3&&goodscategory!=4&&goodscategory!=5){
			//查询所有信息
			goodsinfo=goodsservice.queryallgoods();
		}else{
			//使用goodscategory来查询信息
			goodsinfo=goodsservice.querywithcatagory(goodscategory);
		}
		model.addAttribute("goodscategory", goodscategory);
		model.addAttribute("goodsinfo", goodsinfo);
		model.addAttribute("price", 0);//给商品的价格排序默认赋给一个值0，即不进行价格排序
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		
		return "allGoodsDisplay";
	}
	/**
	 * 显示某个商品的所有信息
	 * @param goodsName 需要显示商品信息的名称
	 * @param model 一个Model对象
	 * @param request HttpServletRequest对象
	 * @return 一个String类型的数据，表示url.
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="goodsdetail.htgo")
	public String goodsDetail(String goodsName,Model model,HttpServletRequest request) throws UnsupportedEncodingException{
		System.out.println("商品详情");
		if(goodsName!=null){
		//goodsName=new String(goodsName.getBytes("iso-8859-1"),"utf-8");
			System.out.println(goodsName);
		
		/*加载商品的信息*/
		GoodsInfo goodsinfo=goodsservice.goodsdetail(goodsName);
		model.addAttribute("goodsinfos", goodsinfo);
		
		/*获取商品的所有评论*/
		List<CommentsInfo> listcomments=goodsservice.getcomment(goodsName);
		model.addAttribute("comments", listcomments);
		model.addAttribute("listcommentsnum", listcomments.size());
		request.setAttribute("listcomments", listcomments);
		
		/*获取商品的所有好评*/
		List<CommentsInfo> bestcomments=goodsservice.getBestComment(goodsName);
		model.addAttribute("bestcomments",bestcomments);
		model.addAttribute("bestcommentsnum", bestcomments.size());
		request.setAttribute("bestcommentss", bestcomments);
		
		/*获取商品的所有中评*/
		List<CommentsInfo> middlecomments=goodsservice.getMiddleComment(goodsName);
		model.addAttribute("middle", middlecomments);
		model.addAttribute("middlecommentsnum", middlecomments.size());
		request.setAttribute("middlecomments", middlecomments);
		
		/*获取商品的所有差评*/
		List<CommentsInfo> worstcomments=goodsservice.getWorstComment(goodsName);
		model.addAttribute("worstcomments", worstcomments);
		model.addAttribute("worstcommentsnum", worstcomments.size());
		request.setAttribute("worstcomments", worstcomments);
		
		/*计算好评率*/
		double gradepercentage=0;
		if((listcomments.size())!=0){
			gradepercentage=(bestcomments.size()*0.1)/(0.1*listcomments.size());
		}
		model.addAttribute("gradePercentage", gradepercentage);
		model.addAttribute("totalcomments", listcomments.size());
		
		return "goodsdetail";
		}else{//用户没有选择产品
			return "main";
		}
	}
	/**
	 * 处理用户对商品的评论
	 * @param goodsname 评论商品的名称
	 * @param text 评论的内容
	 * @param grade 评论的等级
	 * @param session HttpSession对象
	 * @param model Model对象
	 * @param response HttpServletResponse对象
	 * @return 一个String类型的数据，表示url.
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="usercomments.htgo")
	public String UserComments(String goodsname,String text,String grade,HttpSession session,Model model,HttpServletResponse response) throws UnsupportedEncodingException{
		//判断用户是否登录
		String user=(String)session.getAttribute("userName");
		if(user!=null){
			//判断用户是否购买
			boolean whetherbuy=false;
			whetherbuy=goodsservice.whetherbuy(user, goodsname);
			
			if(whetherbuy==true){
				//将用户的评论添加到数据库
				Calendar calendar=Calendar.getInstance();
				Timestamp timestamp=new Timestamp(calendar.getTimeInMillis());
				CommentsInfo insertcomment=new CommentsInfo();
				insertcomment.setId(0);
				insertcomment.setComments(text);
				insertcomment.setGoods(goodsname);
				insertcomment.setGrade(grade);
				insertcomment.setTime(timestamp);
				insertcomment.setUserName(user);
				boolean result=goodsservice.insertcomment(insertcomment);
				if(result == false){
				  model.addAttribute("whetherbuyInfo","评论失败");	
				}else{
				model.addAttribute("whetherbuyInfo", "评论成功");
				}
			}else{
			   model.addAttribute("whetherbuyInfo", "您还未购买");
			}
			model.addAttribute("goodsname", goodsname);
			
			return "toGoodsdetail";
		}else{
			return "toLogin";
		}
		
	}
	/**
	 * 展示所有的商品信息<br/>
	 * 采用分页显示，如果current为Null,那么显示第一页的数据。
	 * @param category 商品的类别
	 * @param price 价格排序
	 * @param current 当前页
	 * @param model 一个Model对象
	 * @return
	 */
	@RequestMapping(value="regoodssdisplay.htgo")
	public String regoodssdisplay(Integer category,Integer price,Integer current,Model model){
        List<GoodsInfo> queryallgoods = goodsservice.queryallgoods();
        System.out.println(queryallgoods);
        List<GoodsInfo> goodsinfo=null;
		if(current==null){
			current=1;
		}
		 Page<Object> page = PageHelper.startPage(current, 10);
		
		//1,食品 2,服装 3,家电 4,手机 5,电脑 6,水果 0,所有
		//当price=0,category=0,无价格排序，所有商品种类
		 if(category==null){
			 category=0;
		 }
		 if(price==null){
			 price=0;
		 }
		if(price==0&&category==0){
			goodsinfo=goodsservice.queryallgoods();
		}
		//当price=0,category!=0,无价格排序，有特定的商品的种类(1-5)
		else if(price==0&&category!=0){
			goodsinfo=goodsservice.querywithcatagory(category);
		}
		//当price=1,category=0,价格按照从低到高排序，所有的商品种类
		else if(price==1&&category==0){
			goodsinfo=goodsservice.queryallgoodsasc();
		}
		//当price=1,Category!=0,价格从低到高，有特定的商品种类
		else if(price==1&&category!=0){
			goodsinfo=goodsservice.querywithcatagoryasc(category);
		}
		//当price=2,Category=0,价格从高到低，所有的商品种类
		else if(price==2&&category==0){
			goodsinfo=goodsservice.queryallgoodsdesc();
		}
		else if(price==2&&category!=0){
			goodsinfo=goodsservice.querywithcatagorydesc(category);
		}
		model.addAttribute("goodsinfo", goodsinfo);
		model.addAttribute("goodscategory", category);
		model.addAttribute("price", price);
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		System.out.println("111");
		return "allGoodsDisplay";
	}
	/**
	 * 搜索商品
	 * @param key 需要查询的key
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("searchgoods.htgo")
	public String searchGoods(String key,Model model,Integer current) throws UnsupportedEncodingException{
		if(current==null){
			current=1;
		}
		model.addAttribute("issearch", true);
		
		Page<Object> page = PageHelper.startPage(current, 10);
		model.addAttribute("current", current);
		//判断key是否存在
		boolean keyExist=false;
		if(key!=null){
			key=new String(key.getBytes("iso-8859-1"),"utf-8");
			keyExist=true;
		}
		if(keyExist){//查询指定条件的数据
			model.addAttribute("key", key);
			
			if(key.contains("数码")){
				List<GoodsInfo> goodsinfo=goodsservice.querywithcatagory(1);
				model.addAttribute("goodsinfo", goodsinfo);
				model.addAttribute("total", page.getTotal());
				return "search";
			}
			if(key.contains("手机")){
				List<GoodsInfo> goodsinfo=goodsservice.querywithcatagory(2);
				model.addAttribute("goodsinfo", goodsinfo);
				model.addAttribute("total", page.getTotal());
				return "search";
			}
			if(key.contains("电脑")){
				List<GoodsInfo> goodsinfo=goodsservice.querywithcatagory(3);
				model.addAttribute("goodsinfo", goodsinfo);
				model.addAttribute("total", page.getTotal());
				return "search";
			}
			if(key.contains("DIY")){
				List<GoodsInfo> goodsinfo=goodsservice.querywithcatagory(4);
				model.addAttribute("goodsinfo", goodsinfo);
				model.addAttribute("total", page.getTotal());
				return "search";
			}
			if(key.contains("外设")){
				List<GoodsInfo> goodsinfo=goodsservice.querywithcatagory(5);
				model.addAttribute("goodsinfo", goodsinfo);
				model.addAttribute("total", page.getTotal());
				return "search";
			}
			if(key.contains("智能")){
				List<GoodsInfo> goodsinfo=goodsservice.querywithcatagory(6);
				model.addAttribute("goodsinfo", goodsinfo);
				model.addAttribute("total", page.getTotal());
				return "search";
			}
			//进行模糊查询
			List<GoodsInfo> goodsinfo=goodsservice.querygoodsThoughVague(key);
			model.addAttribute("goodsinfo", goodsinfo);
			model.addAttribute("total", page.getTotal());
			
			return "search";
		}else{//查询所有数据
			List<GoodsInfo> goodsinfo=goodsservice.queryallgoods();
			model.addAttribute("goodsinfo", goodsinfo);
			model.addAttribute("total", page.getTotal());
			return "search";
		}
	}
}
