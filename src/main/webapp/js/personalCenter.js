/**
 * 
 */
function checkMenu(menu){
	var remenu=/\/order/i.test(menu);//得到用户选择的地址
	if(/\/welcome/i.test(menu)){}//个人中心界面
	else if(/\/order/i.test(menu)){//用户清单
		var order=document.getElementById("order");
		order.style.background="#FAFAFA";
		order.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/shopcart/i.test(menu)){//购物车
		var shopcart=document.getElementById("shopcart");
		shopcart.style.background="#FAFAFA";
		shopcart.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/comments/i.test(menu)){//用户评论
		var comments=document.getElementById("comments");
		comments.style.background="#FAFAFA";
		comments.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/systemmessage/i.test(menu)){//系统消息
		var systemmessage=document.getElementById("systemmessage");
		systemmessage.style.background="#FAFAFA";
		systemmessage.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/account/i.test(menu)){//账户余额
		var account=document.getElementById("account");
		account.style.background="#FAFAFA";
		account.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/myinfo/i.test(menu)){//我的信息
		var myinfo=document.getElementById("myinfo");
		myinfo.style.background="#FAFAFA";
		myinfo.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/acceptAddress/i.test(menu)){//收件地址
		var acceptAddress=document.getElementById("acceptAddress");
		acceptAddress.style.background="#FAFAFA";
		acceptAddress.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/logistics/i.test(menu)){//物流选择
		var logistics=document.getElementById("logistics");
		logistics.style.background="#FAFAFA";
		logistics.style.borderRight="1px solid #FAFAFA";
	}
	else if(/\/logOff/i.test(menu)){//退出登录
		var logOff=document.getElementById("logOff");
		logOff.style.background="#FAFAFA";
		logOff.style.borderRight="1px solid #FAFAFA";
	}
}
var order=document.getElementById("order");
order.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=order";
},true);
var shopcart=document.getElementById("shopcart");
shopcart.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=shopcart";
},true);
var comments=document.getElementById("comments");
comments.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=comments";
},true);
var systemmessage=document.getElementById("systemmessage");
systemmessage.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=systemmessage";
},true);
var account=document.getElementById("account");
account.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=account";
},true);
var myinfo=document.getElementById("myinfo");
myinfo.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=myinfo";
},true);
var acceptAddress=document.getElementById("acceptAddress");
acceptAddress.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=acceptAddress";
},true);
var logistics=document.getElementById("logistics");
logistics.addEventListener("click",function(){
	location.href="personalCenter.htgo?type=logistics";
},true);
var logOff=document.getElementById("logOff");
logOff.addEventListener("click",function(){
	location.href="logOff.htgo";
},true);