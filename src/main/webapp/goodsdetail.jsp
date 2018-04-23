<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.util.*,cn.yuanqing.pojo.*"%>
<% 
@SuppressWarnings("unchecked")
List<CommentsInfo> listcomments = (List<CommentsInfo>)request.getAttribute("listcomments");//获得用户所有评论
@SuppressWarnings("unchecked")
List<CommentsInfo> bestcomments = (List<CommentsInfo>)request.getAttribute("bestcomments");//获得用户好评
@SuppressWarnings("unchecked")
List<CommentsInfo> middlecomments = (List<CommentsInfo>)request.getAttribute("middlecomments");//获得中评
@SuppressWarnings("unchecked")
List<CommentsInfo> worstcomments = (List<CommentsInfo>)request.getAttribute("worstcomments");//获得用户差评

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${goodsinfos.getGoodsName()}</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<link href="${pageContext.request.contextPath}/css/headmall.css"
	type="text/css" rel="stylesheet"></link>
<link href="${pageContext.request.contextPath}/css/mainmall.css"
	type="text/css" rel="stylesheet"></link>
<link href="${pageContext.request.contextPath}/css/goodsdisplay.css"
	type="text/css" rel="stylesheet"></link>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=UfuZjklxjf6BmZvIIdW9c5hjDGvtO9bw"></script>


<c:if test="${empty goodsinfos}">
	<c:redirect url="/goodsdetail.htgo?goodsName=${param.goodsName}"></c:redirect>
</c:if>

<script type="text/javascript">
	function addshopcart(){
	        $.post(
	                "addToShaopcart.htgo",
	                {"url":location.href,"goodsname":$("#currentGoodsName").val(),"goodsnum":$("#product_amount_num").val()},
	                function(res){
	                   show(res.result);
	                },
	                "JSON"
	        );
	}

	function buynow(){
        $.post(
                "buynow.htgo",
                {"url":location.href,"userGoodsLoc":$(".goods_location_input").val(),"goodsname":$("#currentGoodsName").val(),"goodsnum":$("#product_amount_num").val()},
                function(res){
                    show(res.result);
                },
                "JSON"
        );
	}
	function show(info){
		if(info=="你还未登录"){
			layer.msg('你还未登录');
			setTimeout(function(){
				var index = layer.load(1, {
					  shade: [0.1,'#fff'] //0.1透明度的白色背景
				});
			},2000);
			setTimeout(function(){
				window.location.href="${pageContext.request.contextPath}/login.jsp";
			},1000);
		}else{
			layer.msg(info);
		}
	}
</script>
</head>
<body>
	<%@include file="head2.jsp"%>

	<div style="width: 1366px; margin: 0 auto; text-align: center;">

		<div class="headline" style="text-align: left;">
			<div class="linear_gradient"></div>
			<span
				style="font-family: monospace; font-size: 12px; color: black; margin-left: 100px; cursor: pointer; text-decoration: none;"><a
				href="goodsdisplay.jsp" style="color: black; text-decoration: none;">全部分类：</a></span><span
				id="headlinetext" class="linefonttext"></span> <span
				id="headcollectgoods" class="headcollectgoods" title="添加标签">收藏此网页</span>
		</div>
		<div class="detailinfocon">
			<div class="detailpiccon">
				<div class="detailpicsecon">
					<div class="detailpicsource">
						<img alt="picture" id="detailpicimg" class="detailpicimg">
					</div>
				</div>
			</div>
			<div class="goodsinfocon" style="text-align: left;">
				<div class="goods_title">
					<strong><samp id="goods_title_con"
							style="font-size: 22px;">${goodsinfos.getGoodsName()}</samp></strong>
				</div>
				<div class="goods_title_desc">${goodsinfos.getGoodsDesc()}</div>
				<div class="goods_title_maker">${goodsinfos.getGoodsMaker()}</div>
				<div class="goods_price">
					<div class="goods_price_youhui">优惠价</div>
					&nbsp;&nbsp;¥<span class="goods_price_shuzhi">${goodsinfos.getGoodsprice()}</span>
				</div>
				<div class="goods_num">
					<span class="goods_kuchun_font" style="font-size: 23px;">库&nbsp;&nbsp;存</span>
					<span class="goods_kuchun_shuzhi">${goodsinfos.getGoodsNum()}</span>件
				</div>





				<div id="goodsform">
					<div class="locaion_accept">
						<span class="goods_location_font">定位到您当前的城市为：</span> <input
							type="text" id="headmalllogistic" name="userGoodsLoc"
							class="goods_location_input" style="border: 1px solid black"
							disabled />
					</div>
					<input type="hidden" name="goodsname" id="currentGoodsName"
						value="${goodsinfos.getGoodsName()}" />
					<div class="goods_trade">
						<span class="product_amount"> <input
							id="product_amount_num" class="product_amount_left"
							name="goodsnum" value=1 type="text"
							onkeyup="checkproductamount()"> <span
							class="product_amount_right"> <span
								class="product_amount_up"> <span class="product_up_patt"
									onclick="increaseCount()"></span>
							</span> <span class="product_amount_bottom"> <span
									class="product_bottom_patt" onclick="descreaseCount()"
									id="product_bottom_patt_id"></span>
							</span>
						</span>
						</span> <span class="shoppingCart"> <span class="shoppingCartpatt"></span>
							<span class="shoppingCartText" onclick="addshopcart()">加入购物车</span>
						</span> <span class="tradeButton"> <span onclick="buynow()"
							style="font-size: 22px;">立即购买</span>
						</span>
					</div>
				</div>
				<div class="bdsharebuttonbox">
					<a href="#" class="bds_more" data-cmd="more"></a> <a href="#"
						class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a
						href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a> <a
						href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a> <a
						href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
					<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
				</div>
			</div>
		</div>
		<div class="comments_part" style="text-align: left">
			<div class="goodrate_posi">
				<div class="percentageCon">
					<canvas id="myCanvas" class="myCanvas" width="120" height="120">您的浏览器不支持canvas，请升级到最新版本</canvas>
					<div id="gradevalue" class="gradevalue"></div>
					<div id="gradetext" class="gradetext">好评率</div>
				</div>
				<div class="classify">
					<div class="classifyinfo">
						<div id="classifybox1" class="classifybox">
							<div id="classifytext1" class="classifytext">
								<div id="classifypattexternal1" class="classifypattexternal">
									<div id="classifypattinternal1" class="classifypattinternal"></div>
								</div>
								全部<span style="font-size: 20px;">(${listcommentsnum})</span>
							</div>
						</div>

						<div id="classifybox2" class="classifybox">
							<div id="classifytext2" class="classifytext">
								<div id="classifypattexternal2" class="classifypattexternal">
									<div id="classifypattinternal2" class="classifypattinternal"></div>
								</div>
								好评<span style="font-size: 20px;"><c:if
										test="${bestcommentsnum!=0}">(${bestcommentsnum})</c:if>
									<c:if test="${bestcommentsnum==0}"></c:if></span>
							</div>
						</div>
						<div id="classifybox3" class="classifybox">
							<div id="classifytext3" class="classifytext">
								<div id="classifypattexternal3" class="classifypattexternal">
									<div id="classifypattinternal3" class="classifypattinternal"></div>
								</div>
								中评<span style="font-size: 20px;"><c:if
										test="${middlecommentsnum!=0}">(${middlecommentsnum})</c:if>
									<c:if test="${middlecommentsnum==0}"></c:if></span>
							</div>
						</div>
						<div id="classifybox4" class="classifybox">
							<div id="classifytext4" class="classifytext">
								<div id="classifypattexternal4" class="classifypattexternal">
									<div id="classifypattinternal4" class="classifypattinternal"></div>
								</div>
								差评<span style="font-size: 20px;"><c:if
										test="${worstcommentsnum!=0}">(${worstcommentsnum})</c:if>
									<c:if test="${worstcommentsnum==0}"></c:if></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="comments_text">
				<div id="allcontent" style="display: block">

					<c:forEach var="item" items="${listcomments}">
						<div class="comments_patt">
							<div class="comments_line"></div>
							<div class="comments_patt_level">
								评级:<span class="comment_patt_lev_com"><c:out
										value="${item.getGrade()}" /></span>
							</div>
							<div class="comments_contents">
								内容:<span class="comment_contents_con"><c:out
										value="${item.getComments()}" /></span>
							</div>
							<div class="comments_time">
								时间:<span class="comments_time_contents"><c:out
										value="${item.getTime()}" /></span>
							</div>
							<div class="comments_user">
								用户:<span class="comments_user_con"><c:out
										value="${item.getUserName()}" /></span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="goodcontents" style="display: none">
					<c:forEach var="item" items="${bestcomments}">
						<div class="comments_patt">
							<div class="comments_line"></div>
							<div class="comments_patt_level">
								评级:<span class="comment_patt_lev_com"><c:out
										value="${item.getGrade()}" /></span>
							</div>
							<div class="comments_contents">
								内容:<span class="comment_contents_con"><c:out
										value="${item.getComments()}" /></span>
							</div>
							<div class="comments_time">
								时间:<span class="comments_time_contents"><c:out
										value="${item.getTime()}" /></span>
							</div>
							<div class="comments_user">
								用户:<span class="comments_user_con"><c:out
										value="${item.getUserName()}" /></span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="middlecontent" style="display: none">
					<c:forEach var="item" items="${middlecomments}">
						<div class="comments_patt">
							<div class="comments_line"></div>
							<div class="comments_patt_level">
								评级:<span class="comment_patt_lev_com"><c:out
										value="${item.getGrade()}" /></span>
							</div>
							<div class="comments_contents">
								内容:<span class="comment_contents_con"><c:out
										value="${item.getComments()}" /></span>
							</div>
							<div class="comments_time">
								时间:<span class="comments_time_contents"><c:out
										value="${item.getTime()}" /></span>
							</div>
							<div class="comments_user">
								用户:<span class="comments_user_con"><c:out
										value="${item.getUserName()}" /></span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div id="worstContent" style="display: none">
					<c:forEach var="item" items="${middlecomments}">
						<div class="comments_patt">
							<div class="comments_line"></div>
							<div class="comments_patt_level">
								评级:<span class="comment_patt_lev_com"><c:out
										value="${item.getGrade()}" /></span>
							</div>
							<div class="comments_contents">
								内容:<span class="comment_contents_con"><c:out
										value="${item.getComments()}" /></span>
							</div>
							<div class="comments_time">
								时间:<span class="comments_time_contents"><c:out
										value="${item.getTime()}" /></span>
							</div>
							<div class="comments_user">
								用户:<span class="comments_user_con"><c:out
										value="${item.getUserName()}" /></span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="inputcomment">
				<form id="formtext" action="" method="post">
					<input type="text" style="display: none;" name="goodsname"
						value="${goodsinfos.getGoodsName()}">
					<div class="inputcommentframe">
						<div class="inputcommenttext">
							<textarea id="commentcontent" class="commentstext" rows="7"
								cols="80" name="text" style="border-width: 0px;"></textarea>
						</div>
						<div class="commentslength">
							字数：<span id="commentsnum">200</span>
						</div>
						<div class="commentbottom">
							<span class="commentbuttonpart"><input id="button"
								onclick="textsubmit()" type="submit" value="提交评论"
								style="cursor: pointer;" /></span> <span class="commentgrade"> <input
								type="radio" name="grade" value="好评" checked />好评 <input
								type="radio" name="grade" value="中评" />中评 <input type="radio"
								name="grade" value="差评" />差评
							</span>
						</div>
					</div>
				</form>
			</div>
			<br /> <br />
			<%@include file="footer2.jsp"%>
		</div>
	</div>
</body>
<script type="text/javascript">
var anglePercentage=${gradePercentage};
var totalcomments=${totalcomments};
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/site_headmall.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/goods_show_page.js"></script>
<script type="text/javascript">
var whetherbuyInfo="${whetherbuyInfo}";
if(whetherbuyInfo!=""){
	alert(whetherbuyInfo);
}
var goodspicsource= "${goodsinfos.getGoodsPic()}";
document.getElementById("detailpicimg").src="${pageContext.request.contextPath}/img/goods/"+goodspicsource;
var categoryNum=new Number;
categoryNum=${goodsinfos.getGoodsCategory()};
var categoryString=countCategory(categoryNum);
var cat_goods_name="${goodsinfos.getGoodsName()}";
document.getElementById("headlinetext").innerHTML=categoryString+cat_goods_name;

//使用百度地图定位
function myFun(result){
	var cityName = result.name;
	document.getElementById("headmalllogistic").value=cityName;
}
var myCity = new BMap.LocalCity();
myCity.get(myFun);
</script>
</html>