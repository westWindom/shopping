package cn.yuanqing.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import cn.yuanqing.pojo.*;
import cn.yuanqing.service.AdminService;
import cn.yuanqing.service.GoodsService;
import cn.yuanqing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 * 管理员控制器<br/>
 * 该类主要负责处理和管理员相关的请求<br/>
 * @author yq
 *
 */
@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	@Autowired
	GoodsService goodsService;
	@Autowired
	UserService userService;
	
	/**
	 * 管理员登录
	 * @param admin 管理员名称
	 * @param password 管理员密码
	 * @param model Model对象
	 * @param session HttpSession对象
	 * @return
	 */
	@RequestMapping(value="admin/adminlogin.htgo")
	public Object adminlogin(String admin,String password,Model model,HttpSession session){
		AdminInfo admininfo=new AdminInfo();
		admininfo.setAdminName(admin);
		admininfo.setAdminPsw(password);
		admininfo=adminService.queryadmin(admininfo);
		if(admininfo==null){
			//登录失败
			model.addAttribute("info", "登录失败");
			model.addAttribute("url", "../adminlogin.jsp");
		}else{
			//登录成功
			model.addAttribute("info", "登录成功");
			model.addAttribute("url", "../adminmanage.jsp");
			session.setAttribute("admin",admin);
		}
		return "../adminResultStatus";
	}
	
	/**
	 * 显示商品的所有信息<br/>
	 * 以分页显示，每一个页的数量是10<br/>
	 * 如果current为null，那么取出第一页的数据
	 * 
	 * @param current 当前页
	 * @param model Model对象
	 * @return 一个String类型，表示url的地址
	 */
	@RequestMapping(value="admin/allgoods.htgo")
	public String goodsmanageOfAdmin(Integer current,Model model){
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current,10);
		
		List<GoodsInfo> goodsinfo=null;
		goodsinfo=goodsService.queryallgoods();
		model.addAttribute("goodsinfo", goodsinfo);
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		
		return "allgoods";
	}
	/**
	 * 编辑商品
	 * @param model Model对象
	 * @param goodsinfos 商品信息对象
	 * @return 一个String类型，表示url地址
	 */
	@RequestMapping(value="admin/editgoods.htgo")
	public String goodsEditOfAdmin(Model model,GoodsInfo goodsinfos){
		
		GoodsInfo goodsinfo=new GoodsInfo();
		goodsinfo=goodsService.goodsdetail(goodsinfos.getGoodsName());
		model.addAttribute("goodsinfo", goodsinfo);
		return "editgoods";
	}
	/**
	 * 更新商品信息
	 * @param model Model对象
	 * @param goodsinfo 商品信息
	 * @param goodspicfile 图片对象
	 * @param response HttpServerletResponse对象
	 * @param request HttpServletRequest对象
	 * @return 一个String类型的数据，表示url地址
	 */
	@RequestMapping(value="admin/submitgoods.htgo")
	public String goodsmodifiedOfAdmin(Model model,GoodsInfo goodsinfo,MultipartFile goodspicfile,HttpServletResponse response,HttpServletRequest request){
		if(goodspicfile.getSize()!=0){
			String result=fielUpload(goodspicfile,response,request);
			
			if("上传错误,图片的格式只能为jepg,png,jpg,图片的大小最大为1M的图片".equals(result)){
				model.addAttribute("message", "更新失败,图片上传错误,图片的格式只能为jepg,png,jpg,图片的大小最大为1M的图片");
				return "upgoods";
			}
			goodsinfo.setGoodsPic(result);
			
			//更具用户名更改数据库中的数据
			if(goodsService.upgoodsbyname(goodsinfo)){
				model.addAttribute("message", "更新成功");
			}else{
				model.addAttribute("message", "更新失败");
			}
		}else{
			if(goodsService.upgoodsbynameexcpic(goodsinfo)){
				model.addAttribute("message", "更新成功");
			}else{
				model.addAttribute("message", "更新失败");
			}
		}
		return "upgoods";
	}
	/**
	 * 删除商品信息
	 * @param model Model对象
	 * @param goodsName 商品名称
	 * @return 一个String类型的url，表示url地址
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value="admin/deletegoods.htgo")
	public String goodsdelete(Model model,String  goodsName) throws UnsupportedEncodingException{
		goodsName=new String(goodsName.getBytes("iso-8859-1"),"utf-8");
		GoodsInfo goodsinfo=new GoodsInfo();
		goodsinfo.setGoodsName(goodsName);
		if(goodsService.degoodsbyname(goodsinfo)){
			model.addAttribute("message","删除成功");
		}else{
			model.addAttribute("message", "删除失败");
		}
		return "upgoods";
	}
	/**
	 * 添加商品信息
	 * @param model Model对象
	 * @param goodsinfo 商品信息
	 * @param goodspicfile 商品图片
	 * @param response HttpServeletResponse对象
	 * @param request HttpServletRequest对象
	 * @return 一个String类型的数据，表示url。
	 */
	@RequestMapping(value="admin/addgoods.htgo")
	public String addgoods(Model model,GoodsInfo goodsinfo,MultipartFile goodspicfile,HttpServletResponse response,HttpServletRequest request){
		boolean addresult=false;
		String result=fielUpload(goodspicfile,response,request);
		if("上传错误,图片的格式只能为jepg,png,jpg,图片的大小最大为1M的图片".equals(result)){
				model.addAttribute("message", "添加失败失败,图片上传错误,图片的格式只能为jepg,png,jpg,图片的大小最大为1M的图片");
				return "upgoods";
		}
		goodsinfo.setGoodsPic(result);
		addresult=goodsService.insgoodsinfo(goodsinfo);
		
		if(addresult){
			model.addAttribute("message", "添加成功");
		}else{
			model.addAttribute("message", "添加失败");
		}
		return "upgoods";
	}
	
	/**
	 * 图片上传的方法
	 * @param file 文件对象
	 * @param response HttpSerlverResponse对象
	 * @param request HttpServletRequest对象
	 * @return 一个String类型的数据，表示url
	 */
	public String fielUpload(MultipartFile file,HttpServletResponse response,HttpServletRequest request){
	     //判断文件的类型------------------//
        String fileName = file.getOriginalFilename();
        if(fileName.endsWith(".jpeg")||fileName.endsWith(".png")||fileName.endsWith(".jpg")){
        //判断文件的类型------------------//
            //上传的是图片
        //图片大小的判断---------------------//
            int size = 1024*1024;
            //文件大小是否过大 , true表示过大
            boolean flag = false;
            if(file.getSize()<Integer.MAX_VALUE){
                int fileSize = (int) file.getSize();
                if(fileSize>size){
                    //文件过大
                    flag = true;
                }else{
                    //大小合适
                    flag = false;
                }
            }else{
                //文件大小过大
                flag = true;
            }
            //文件过大 则响应错误页面
            if(flag){
                //文件过大
                return "上传错误,图片的格式只能为jepg,png,jpg,图片的大小最大为1M的图片";
            }else{
                //文件大小正常 ,将文件存储到项目当前运行目录下
                String dirPath = request.getServletContext().getRealPath("/");//获取当前项目运行时的目录  // 获取到的目录: webContent目录
                File imgDir = new File(dirPath+"/img/goods");
                if(!imgDir.exists())
                    imgDir.mkdirs();
                try {
                    fileName = fileName.replace(".", ",");
                    String newFileName = System.currentTimeMillis()+"."+(fileName.split(",")[fileName.split(",").length-1]);
                    file.transferTo(new File(imgDir,newFileName ));
                    return newFileName;//返回存储的文件名称
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }else{
            //上传的是其他文件
            System.out.println("上传的不是图片");
        }
        
        return "上传错误,图片的格式只能为jepg,png,jpg,图片的大小最大为1M的图片";
	}
	/**
	 * 显示所有的用户<br/>
	 * 分页显示，每一页的数量为10.<br/>
	 * 
	 * @param current 当前页
	 * @param model Model对象
	 * @return 一个String类型的对象，表示url。
	 */
	@RequestMapping(value="admin/alluser.htgo")
	public String usermanage(Integer current, Model model){
		if(current==null){
			current=1;
		}
		 Page<Object> page = PageHelper.startPage(current, 10);
		
		List<UserInfo> userinfo=null;
		userinfo=userService.queryalluser();
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		
		return "alluser";
	}
	/**
	 * 删除用户
	 * @param model Model对象
	 * @param userinfo 需要删除的用户
	 * @return 一个String类型的数据,表示url.
	 */
	@RequestMapping(value="admin/deleteuser.htgo")
	public String userdelete(Model model,UserInfo userinfo){
		if(userService.deuserbyname(userinfo)){
			model.addAttribute("message", "删除成功");
		}else{
			model.addAttribute("message", "删除失败");
		}
		return "upuser";
	}
	/**
	 * 编辑用户信息
	 * @param model Model对象
	 * @param userinfo 需要编辑的用户
	 * @return 一个String类型的数据，表示url.
	 */
	@RequestMapping(value="admin/edituser.htgo")
	public String userEdit(Model model,UserInfo userinfo){
		userinfo=userService.selectbyname(userinfo);
		model.addAttribute("userinfo", userinfo);
		return "edituser";
	}
	/**
	 * 更新用户信息
	 * @param model Model对象
	 * @param userinfo 需要编辑的用户信息
	 * @return 一个String类型的数据，表示url.
	 */
	@RequestMapping(value="admin/submituser.htgo")
	public String usermodified(Model model,UserInfo userinfo){
		if(userService.upuserbyname(userinfo)){
			model.addAttribute("message", "更新成功");
		}else{
			model.addAttribute("message", "更新失败");
		}
		return "upuser";
	}
	/**
	 * 查看所有的用户的评论<br/>
	 * 采用分页显示，每一页的数量为10<br/>
	 * 如果cuurent为null，那么取第一页的数据
	 * @param current 当前页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="admin/allcomments.htgo")
	public String allcomment(Integer current,Model model){
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 10);
		
		List<CommentsInfo> comments=null;
		comments=userService.allcomments();
		model.addAttribute("comments", comments);
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		return "allcomments";
	}
	/**
	 * 显示所有用户的余额,<br/>
	 * 采用分页显示，每一页的数量都是10<br/>
	 * 如果current为null,那么取第一页的数据
	 * @param current 当前页码
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url.
	 */
	@RequestMapping(value="admin/allaccount.htgo")
	public String allaccount(Integer current,Model model){
		if(current==null)
			current=1;
		Page<Object> page = PageHelper.startPage(current, 10);
		
		List<UseraccountInfo> useraccount=null;
		useraccount=userService.allaccount();
		model.addAttribute("useraccount", useraccount);
		
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		
		return "allaccount";
	}
	/**
	 * 查询用户的账户
	 * @param model Model对象
	 * @param useraccount 需要查询的用户
	 * @return 一个String类型，表示URL。
	 */
	@RequestMapping(value="admin/editaccount.htgo")
	public String accountEdit(Model model,UseraccountInfo useraccount){
		useraccount=userService.selectaccountbyname(useraccount);
		model.addAttribute("useraccount", useraccount);
		return "editaccount";
	}
	/**
	 * 更新用户的账户
	 * @param model Model对象
	 * @param useraccountinfo 需要更新的用户账户信息
	 * @return 一个String类型的数据，表示URL.
	 */
	@RequestMapping(value="admin/submitaccount.htgo")
	public String accountmodified(Model model,UseraccountInfo useraccountinfo){
		if(userService.upaccountbyname(useraccountinfo)){
			model.addAttribute("message", "更新成功");
		}else{
			model.addAttribute("message", "更新失败");
		}
		return "upaccount";
	}
	/**
	 * 显示用户的所有订单信息<br/>
	 * 采用分页显示，每一页的数量都是10<br/>
	 * 如果为null，那么取第一页的数据
	 * @param current 当前订单页
	 * @param model
	 * @return
	 */
	@RequestMapping(value="admin/allorder.htgo")
	public String allorder(Integer current, Model model){
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 10);
		List<OrderlistInfo> orderlist=userService.allorder();
		model.addAttribute("orderlist", orderlist);
		
		
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		
		return "allorder";
	}
	/**
	 * 显示所有的订单信息<br/>
	 * 采用分页显示，每一页的数量都是10<br/>
	 * 如果current为null,那么取第一页的数据
	 * @param current 当前页
	 * @param model Model对象
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="admin/allcart.htgo")
	public String allcart(Integer current,Model model){


		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 10);
		List<ShopcartInfo> shopcart=userService.allcart();
		model.addAttribute("shopcart", shopcart);
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		return "allcart";
	}
	
	/**
	 * 查询所有的广告商品信息
	 * @param current 当前页的商品
	 * @param model 一个Model对象
	 * @param adtype 广告的类型
	 * @return 一个String类型的数据，表示url
	 */
	@RequestMapping(value="admin/alladgoods.htgo")
	public String alladgoods(Integer current,Model model,String adtype){
		System.out.println("哈哈哈");
		List<GoodsInfo> goodsinfo=goodsService.queryallgoods();
		model.addAttribute("goodsinfo", goodsinfo);
		
		if(current==null){
			current=1;
		}
		Page<Object> page = PageHelper.startPage(current, 10);
		
		List<GoodsInfo> invalidgoods=new ArrayList<GoodsInfo>();
		
		adtype=adtype.toString();
		if(adtype.equalsIgnoreCase("bigscreen")){
			//大屏幕广告
			List<GoodsMainInfo> bigscreenad=goodsService.screenad();
			model.addAttribute("adlist",bigscreenad);
			model.addAttribute("adnum", 8);
			model.addAttribute("title", "大屏幕广告");
			//查询目前广告中，那些商品失效了
			invalidgoods=goodsService.queryInvalidbiscreeand("bigscreenad");
//			for(GoodsMainInfo g:bigscreenad){
//				System.out.println(g.getGoodsName());
//			}
//			System.out.println("=-------");
//			for(GoodsInfo g:invalidgoods){
//				System.out.println(g.getGoodsName());
//			}
		}else if(adtype.equalsIgnoreCase("popular")){
			//热门商品
			List<GoodsMainInfo> populargoods=goodsService.popular();
			model.addAttribute("adlist", populargoods);
			model.addAttribute("adnum", 6);
			model.addAttribute("title", "热门商品");
			//查询目前广告中，那些商品失效了
			invalidgoods=goodsService.queryInvalidbiscreeand("populargoods");
		}else if(adtype.equalsIgnoreCase("recommand")){
			//推荐商品
			List<GoodsMainInfo> recommend=goodsService.recommend();
			model.addAttribute("adlist", recommend);
			model.addAttribute("adnum", 6);
			model.addAttribute("title", "推荐商品");
			//查询目前广告中，那些商品失效了
			invalidgoods=goodsService.queryInvalidbiscreeand("recommendgoods");
		}else if(adtype.equalsIgnoreCase("new")){
			//新品上市
			List<GoodsMainInfo> newgoods=goodsService.newgoods();
			model.addAttribute("adlist", newgoods);
			model.addAttribute("adnum", 6);
			model.addAttribute("title", "新品上市");
			//查询目前广告中，那些商品失效了
			invalidgoods=goodsService.queryInvalidbiscreeand("newgoods");
		}else{
			//出错，没有商品
			List<GoodsMainInfo> empty=null;
			model.addAttribute("adlist",empty);
			model.addAttribute("adnum", 0);
			model.addAttribute("title", "");
			invalidgoods=null;
		}
		
		//查询所有的商品
		model.addAttribute("adtype", adtype);
		model.addAttribute("invalidgoods", invalidgoods);
		model.addAttribute("current", current);
		model.addAttribute("total", page.getTotal());
		
		
		return "adgoods";
	}
	/**
	 * 更新广告信息
	 * @param model 一个Model对象
	 * @param goodsId 需要更新的广告的id
	 * @param adtype 广告的类型
	 * @param reGoodsId 需要更新为的广告的id
	 * @return
	 */
	@RequestMapping(value="admin/upad.htgo")
	public String upad(Model model,String goodsId,String adtype,String reGoodsId){
		//
		System.out.println(adtype);
		String table;
		if(reGoodsId.equals("-1")){
			//管理员没有更改数据
			model.addAttribute("message", "更新成功");
		}else{
			if(adtype.equals("bigscreen")){table="bigscreenad";}
			else if(adtype.equals("popular")){table="populargoods";}
			else if(adtype.equals("recommand")){table="recommendgoods";}
			else if(adtype.equals("new")){table="newgoods";}
			else{table="";}
			
			int goodsid=Integer.parseInt(goodsId);
			int regoodsid=Integer.parseInt(reGoodsId);
			GoodsInfo goodsinfo=new GoodsInfo();
			goodsinfo=goodsService.getgoodsbyid(regoodsid);
			if(goodsService.uptablead(table, goodsid, regoodsid,goodsinfo)){
				model.addAttribute("message", "更新成功");
			}else{
				model.addAttribute("message", "更新失败");
			}
		}
		return "upad";
	}
	/**
	 * 查询所有的用户
	 * @param model 一个Model对象
	 * @return 一个String类型的数据，表示url。
	 */
	@RequestMapping(value="admin/sendmessage.htgo")
	public String sendmessage(Model model){
		System.out.println("查找所有用户");
		List<UserInfo> userinfo=userService.queryalluser();
		model.addAttribute("userinfo", userinfo);
		return "sendmessage";
	}

	/**
	 * 发送系统消息
	 * @param model 一个Model对象
	 * @param text 需要发送的消息
	 * @param accepter 接受者
	 * @return 一个String类型的数据，表示url.
	 */
	@RequestMapping(value="admin/upmessage.htgo")
	public String upmessage(Model model,String text,String accepter){
		if(text.isEmpty()||accepter.isEmpty()){
			model.addAttribute("message", "发送失败");
			return "upsystmessage";
		}
		
		SystemMessageInfo systemmessage=new SystemMessageInfo();
		systemmessage.setContents(text);
		systemmessage.setAccepter(accepter);
		//时间添加到数据库
		Calendar calendar=Calendar.getInstance();
		Timestamp timestamp=new Timestamp(calendar.getTimeInMillis());
		systemmessage.setTime(timestamp);
		
		if(userService.upmessage(systemmessage)){
			model.addAttribute("message", "发送成功");
		}else{
			model.addAttribute("message", "发送失败");
		}
		return "upsystmessage";
	}
}
