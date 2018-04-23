<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注册</title>
<link href="${pageContext.request.contextPath}/img/logo/titleIcon.ico"
	rel="SHORTCUT ICON" />
<script type="/text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script type="/text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css" />
<link href="${pageContext.request.contextPath}/css/drag.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/drag.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/gVerify.js"></script>
</head>
<body>
	<%@include file="head1.jsp"%>
	<div id="containerre" style="background-image: url('img/beijing.gif');">
		<div id="regbac">
			<div>
				<div id="headofhead"></div>
				<h2 id="thead">网上商城用户注册</h2>
			</div>
			<div id="usercontainer">
				<span id="headofuser">用户名</span> <input id="user" type="text"
					name="regName" /> <span id="userResultParent"></span>
			</div>
			<div id="emailcontainer">
				<span id="headofemail">邮箱</span> <input id="email" type="text" name="email" /> <span id="emailResultParent"></span>
			</div>
			
			<div id="emailvalidecontainer">
				<div class="emailValide"></div>
			</div>
						
			<div id="passwordcontainer">
				<span id="headofpassword">密码</span> <input id="password"
					name="password" type="password" autocomplete="off" /> <span
					id="passwordResultParent"></span>
			</div>
			<div>
				<span id="headofcheckpassword">确认密码</span> <input
					id="checkPassword" type="password" autocomplete="off" /> <span
					id="checkpasswordParent"></span>
			</div>
			<div id="dragbox">
				<div id="drag"></div>
			</div>
			<div id="box2" class="togglehidden">
				<div id="v_container"></div>
				<br /> <input type="text" id="code_input" value=""
					placeholder="请输入验证码" />
			</div>
			<div>
				<span id="cantidentity" onclick="changeWay()">不能校验？点我更换校验方式</span>
			</div>
			<div id="rbtd">
				<span id="headofregiste"></span> <span id="registeButton">注册</span>
			</div>

		</div>

		<script type="text/javascript">
$('#drag').drag();
var verifyCode = new GVerify("v_container");
</script>

		<%@include file="footer1.jsp"%>
	</div>
</body>
<script type="text/javascript">
function changeWay(){
	$("#dragbox").toggleClass("togglehidden");
	$("#box2").toggleClass("togglehidden");
}

var userRegiste=false;
var user =document.getElementById("user");
user.addEventListener("focus",function(){
	userRegiste=false;
	user.style.border="1px solid rgb(222, 222, 222)";
    var userResult2=document.getElementById("userResult2");
    var userResult3=document.getElementById("userResult3");
    if(userResult2!=null){
    	var element=document.getElementById("userResultParent");
    	var parent=element.parentNode;
    	parent.removeChild(userResult2);
    }
    if(userResult3!=null){
    	var element=document.getElementById("userResultParent");
    	var parent=element.parentNode;
    	parent.removeChild(userResult3);
    }
    
	var userResult=document.createElement("span");
	userResult.id="userResult";
	userResult.name="userResult";
	var usernode=document.createTextNode("请输入3到12位的数字或字母");
	userResult.appendChild(usernode);
	var element=document.getElementById("userResultParent");
	var parent=element.parentNode;
	parent.insertBefore(userResult, element);
});
user.addEventListener("blur",function(e){
    var userResult=document.getElementById("userResult");
	var element=document.getElementById("userResultParent");
	var parent=element.parentNode;
	parent.removeChild(userResult);
	var userValue=user.value;
	//去除字符串两边的空格
	var vUser=userValue.trim();
	var length=vUser.length;
	var reUserResult=null;
	var reUserNode=null;
	if(length<3||length>12){
		user.style.border="1px solid red";
		reUserResult= document.createElement("span");
		reUserNode=document.createTextNode("用户名需要3到12位字符");
		reUserResult.appendChild(reUserNode);
		reUserResult.id="userResult3";
	}else{
		
		var res=vUser.match(/ /g);
		if(res!=null){
			user.style.border="1px solid red";
			reUserResult= document.createElement("span");
			reUserNode=document.createTextNode("用户名不能包含空格");
			reUserResult.appendChild(reUserNode);
			reUserResult.id="userResult3";
		}else{
		    var xmlhttp;
		    if(window.XMLHttpRequest){
		        xmlhttp = new XMLHttpRequest();
		    }else{
		        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		    }
		    //传入回调函数onreadystatechange
		    xmlhttp.onreadystatechange=function(){
		        if(xmlhttp.readyState==4 && xmlhttp.status==200){//请求成功
		        	if(xmlhttp.responseText==1){//表示已经有人注册
		        		alert("该用户名已经被人注册");
		    			user.style.border="1px solid red";
		    			reUserResult= document.createElement("span");
		    			reUserNode=document.createTextNode("该用户名已经被人人注册");
		    			reUserResult.appendChild(reUserNode);
		    			reUserResult.id="userResult3";
		        		//layer.open({
		        		//	  type: 1,
		        		//	  skin: 'layui-layer-rim', //加上边框
		        		//	  area: ['320px', '140px'], //宽高
		        		//	  content:'该用户名已经被注册'
		        		//});
		        	}else{//未有人注册
		        		reUserResult=document.createElement("img");
						reUserResult.src="img/ok.gif";
						reUserResult.id="userResult2";
						userRegiste=true;
						var element=document.getElementById("userResultParent");
						var parent=element.parentNode;
						parent.insertBefore(reUserResult, element);
		        	}
		        }
		    }
		    //发送请求
		    xmlhttp.open("GET","isregist.htgo?name="+user.value,true);
		    xmlhttp.send();
		}
		var element=document.getElementById("userResultParent");
		var parent=element.parentNode;
		parent.insertBefore(reUserResult, element);
	}
	
});
var emailRegiste=false;
var email=document.getElementById("email");
email.addEventListener("focus",function(){
	emailRegiste=false;
	email.style.border="1px solid rgb(222, 222, 222)";
    var emailResult2=document.getElementById("emailResult2");
    var emailResult3=document.getElementById("emailResult3");
    if(emailResult2!=null){
    	var element=document.getElementById("emailResultParent");
    	var parent=element.parentNode;
    	parent.removeChild(emailResult2);
    }
    if(emailResult3!=null){
    	var element=document.getElementById("emailResultParent");
    	var parent=element.parentNode;
    	parent.removeChild(emailResult3);
    }
    
	var emailResult=document.createElement("div");
	emailResult.id="emailResult";
	emailResult.name="emailResult";
	var emailnode=document.createTextNode("请填写正确的邮箱号");
	emailResult.appendChild(emailnode);
	var element=document.getElementById("emailResultParent");
	var parent=element.parentNode;
	parent.insertBefore(emailResult, element);
});
email.addEventListener("blur",function(e){
    var emailResult=document.getElementById("emailResult");
	var element=document.getElementById("emailResultParent");
	var parent=element.parentNode;
	parent.removeChild(emailResult);
	var emailValue=email.value;
	//去除字符串两边的空格
	var vEmail=emailValue.trim();
	var reEmailResult=null;
	var reEmailNode=null;
	var res=vEmail.match(/^([0-9A-Za-z\-_\.]+)@([0-9a-z]+\.[a-z]{2,3}(\.[a-z]{2})?)$/g);
	if(res==null){
		email.style.border="1px solid red";
		reEmailResult= document.createElement("span");
		reEmailNode=document.createTextNode("格式错误，请输入正确的邮箱号");
		reEmailResult.appendChild(reEmailNode);
		reEmailResult.id="emailResult2";
	}else{
		reEmailResult=document.createElement("img");
		reEmailResult.id="emailResult3";
		reEmailResult.src="img/ok.gif";
		emailRegiste=true;
	}
	var element=document.getElementById("emailResultParent");
	var parent=element.parentNode;
	parent.insertBefore(reEmailResult, element);
});
var passwordRegiste=1;
var password =document.getElementById("password");
password.addEventListener("focus",function(){
	passwordRegiste=1;
	password.style.border="1px solid rgb(222, 222, 222)";
    var passwordResult2=document.getElementById("passwordResult");
    var passwordResult3=document.getElementById("passwordResult3");
    if(passwordResult2!=null){
    	var parent=passwordResult2.parentNode;
    	parent.removeChild(passwordResult2);
    }
    if(passwordResult3!=null){
    	var element=document.getElementById("passwordResultParent");
    	var parent=element.parentNode;
    	parent.removeChild(passwordResult3);
    }
    
	var passwordResult=document.createElement("span");
	passwordResult.id="passwordResult";
	passwordResult.name="passwordResult";
	var passwordnode=document.createTextNode("6-20个大小写英文字母，符号或数字的组合");
	passwordResult.appendChild(passwordnode);
	var element=document.getElementById("passwordResultParent");
	if(element !=null){
	var parent=element.parentNode;
	  parent.insertBefore(passwordResult, element);
	}
});
password.addEventListener("keyup",function(e){
	password.style.border="1px solid rgb(222, 222, 222)";
	var passwordValue=password.value;
	//去除字符串两边的空格
	var vPassword=passwordValue.trim();
	
	
    var passwordResult=document.getElementById("passwordResult");
	var element=document.getElementById("passwordResultParent");
	if(element!=null){
	var parent=element.parentNode;
	  if(passwordResult!=null){
	      parent.removeChild(passwordResult);
	    }
	}
	var depasswordResult=document.getElementById("repasswordResult");
	if(depasswordResult!=null){
		var dediv1=document.getElementById("passStrength1");
		if(dediv1!=null){
			depasswordResult.removeChild(dediv1);
		}
		var dediv2=document.getElementById("passStrength2");
		if(dediv2!=null){
			depasswordResult.removeChild(dediv2);
		}
		var dediv3=document.getElementById("passStrength3");
		if(dediv3!=null){
			depasswordResult.removeChild(dediv3);
		}
		var dediv4=document.getElementById("passStrength4");
		if(dediv4!=null){
			depasswordResult.removeChild(dediv4);
		}
		var destrong=document.getElementById("passStrengthinfo");
		if(destrong!=null){
			depasswordResult.removeChild(destrong);
		}
		depasswordResult.id="passwordResultParent";
	}
	
      var aLvTxt = ['','弱','中','较强','强'];
      var lv = 0;
      if(vPassword.match(/[a-z]/g)){lv++;}
      if(vPassword.match(/[0-9]/g)){lv++;}
      if(vPassword.match(/[A-Z]/g)){lv++;}
      if(vPassword.match(/(.[^a-zA-Z0-9])/g)){lv++;}
      if(vPassword.length < 6){lv=0;}
      if(lv > 4){lv=4;}
      if(lv==1){
    	   	//创建一个背景版面
    		var bcpasswordResult=document.getElementById("passwordResultParent");
    		bcpasswordResult.id="repasswordResult";
    	    var div1 = document.createElement('span');
    	    div1.id="passStrength1";
    	    div1.style.background="orange";
    	    var div2 = document.createElement('span');
    	    div2.id="passStrength2";
    	    div2.style.background="white";
    	    var div3 = document.createElement('span');
    	    div3.id="passStrength3";
    	    div3.style.background="white";
    	    var div4 = document.createElement('span');
    	    div4.id="passStrength4";
    	    div4.style.background="white";
    	    var strong = document.createElement('strong');
    	    strong.innerHTML=aLvTxt[lv];
    	    strong.id="passStrengthinfo";
    	    
    	    bcpasswordResult.appendChild(div1);
    	    bcpasswordResult.appendChild(div2);
    	    bcpasswordResult.appendChild(div3);
    	    bcpasswordResult.appendChild(div4);
    	    bcpasswordResult.appendChild(strong);
      }
      if(lv==2){
  	   	//创建一个背景版面
  		var bcpasswordResult=document.getElementById("passwordResultParent");
  		bcpasswordResult.id="repasswordResult";
  	    var div1 = document.createElement('span');
  	    div1.id="passStrength1";
  	    div1.style.background="orange";
  	    var div2 = document.createElement('span');
  	    div2.id="passStrength2";
  	    div2.style.background="orange";
  	    var div3 = document.createElement('span');
  	    div3.id="passStrength3";
  	    div3.style.background="white";
  	    var div4 = document.createElement('span');
  	    div4.id="passStrength4";
  	    div4.style.background="white";
  	    var strong = document.createElement('strong');
  	    strong.innerHTML=aLvTxt[lv];
  	    strong.id="passStrengthinfo";
  	    
  	    bcpasswordResult.appendChild(div1);
  	    bcpasswordResult.appendChild(div2);
  	    bcpasswordResult.appendChild(div3);
  	    bcpasswordResult.appendChild(div4);
  	    bcpasswordResult.appendChild(strong);
  	    
    }
      if(lv==3){
    	   	//创建一个背景版面
    		var bcpasswordResult=document.getElementById("passwordResultParent");
    		bcpasswordResult.id="repasswordResult";
    	    var div1 = document.createElement('span');
    	    div1.id="passStrength1";
    	    div1.style.background="orange";
    	    var div2 = document.createElement('span');
    	    div2.id="passStrength2";
    	    div2.style.background="orange";
    	    var div3 = document.createElement('span');
    	    div3.id="passStrength3";
    	    div3.style.background="orange";
    	    var div4 = document.createElement('span');
    	    div4.id="passStrength4";
    	    div4.style.background="white";
    	    var strong = document.createElement('strong');
    	    strong.innerHTML=aLvTxt[lv];
    	    strong.id="passStrengthinfo";
    	    
    	    bcpasswordResult.appendChild(div1);
    	    bcpasswordResult.appendChild(div2);
    	    bcpasswordResult.appendChild(div3);
    	    bcpasswordResult.appendChild(div4);
    	    bcpasswordResult.appendChild(strong);
    	    
      }
      if(lv==4){
    	   	//创建一个背景版面
    		var bcpasswordResult=document.getElementById("passwordResultParent");
    		bcpasswordResult.id="repasswordResult";
    	    var div1 = document.createElement('span');
    	    div1.id="passStrength1";
    	    div1.style.background="orange";
    	    var div2 = document.createElement('span');
    	    div2.id="passStrength2";
    	    div2.style.background="orange";
    	    var div3 = document.createElement('span');
    	    div3.id="passStrength3";
    	    div3.style.background="orange";
    	    var div4 = document.createElement('span');
    	    div4.id="passStrength4";
    	    div4.style.background="orange";
    	    var strong = document.createElement('strong');
    	    strong.innerHTML=aLvTxt[lv];
    	    strong.id="passStrengthinfo";
    	    
    	    bcpasswordResult.appendChild(div1);
    	    bcpasswordResult.appendChild(div2);
    	    bcpasswordResult.appendChild(div3);
    	    bcpasswordResult.appendChild(div4);
    	    bcpasswordResult.appendChild(strong);
      }
});
password.addEventListener("blur",function(e){
    var passwordResult=document.getElementById("passwordResult");
	var element=document.getElementById("passwordResultParent");
	if(element !=null){
	var parent=element.parentNode;
	if(passwordResult !=null){
	    parent.removeChild(passwordResult);
	  }
	}
	var vpassword=password.value;
    var result=vpassword.match(/ /g);
    if(result!=null){
    	passwordRegiste=2;
    }
    if(vpassword.length==0){
    	passwordRegiste=3;
    	password.style.border="1px solid red";
    	var passwordResult=document.createElement("span");
    	passwordResult.id="passwordResult";
    	passwordResult.name="passwordResult";
    	var passwordnode=document.createTextNode("6-20个大小写英文字母，符号或数字的组合");
    	passwordResult.appendChild(passwordnode);
    	var element=document.getElementById("passwordResultParent");
    	if(element !=null){
    	var parent=element.parentNode;
    	  parent.insertBefore(passwordResult, element);
    	}
    }
    if(vpassword.length<6 || vpassword.length>20){
    	passwordRegiste=4;
    }
    var resultdig=vpassword.match(/^\d+$/g);
    if(resultdig!=null){
    	passwordRegiste=5;
    }
});
password.onpaste=function(){return false};
password.oncut=function(){return false};
password.oncopy=function(){return false};
var checkpasswordRgiste=false;
var checkpassword =document.getElementById("checkPassword");
checkpassword.addEventListener("focus",function(){
	checkpasswordRgiste=false;
	checkpassword.style.border="1px solid rgb(222, 222, 222)";

	var chpasResult2=document.getElementById("checkResult2");
    if(chpasResult2!=null){
    	var parent=chpasResult2.parentNode;
    	parent.removeChild(chpasResult2);
    }
	var chpasResult3=document.getElementById("checkResult3");
    if(chpasResult3!=null){
    	var parent=chpasResult3.parentNode;
    	parent.removeChild(chpasResult3);
    }    
	
	var checkpasswordResult=document.createElement("div");
	checkpasswordResult.id="checkpasswordResult";
	checkpasswordResult.name="checkpasswordResult";
	var checkpasswordnode=document.createTextNode("请再次输入密码");
	checkpasswordResult.appendChild(checkpasswordnode);
	var element=document.getElementById("checkpasswordParent");
	var parent=element.parentNode;
	parent.insertBefore(checkpasswordResult, element);
});
checkpassword.addEventListener("blur",function(){
	var chepassre=document.getElementById("checkpasswordResult");
	var chepassreParent=chepassre.parentNode;
	if(chepassre!=null){
		chepassreParent.removeChild(chepassre);
	}
	//check
	var passwordvalue=password.value;
	var chepassvalue=checkpassword.value;
	if(passwordvalue==chepassvalue){
		if(chepassvalue.length!=0){
			checkpassword.style.border="1px solid rgb(222, 222, 222)";
		  cResultimg=document.createElement("img");
		  cResultimg.src="img/ok.gif";
		  cResultimg.id="checkResult2";
		  var element=document.getElementById("checkpasswordParent");
		  var parent=element.parentNode;
		  parent.insertBefore(cResultimg, element);
		  checkpasswordRgiste=true;
		}
		if(chepassvalue.length==0){
			checkpassword.style.border="1px solid red";
		}
	}else{
		checkpassword.style.border="1px solid red";
		  cResultspan= document.createElement("span");
		  cResultspant=document.createTextNode("两次密码输入不一致");
		  cResultspan.appendChild(cResultspant);
		  cResultspan.id="checkResult3";
		  var element=document.getElementById("checkpasswordParent");
		  var parent=element.parentNode;
		  parent.insertBefore(cResultspan, element);
	}
});
//进行验证码校验
var identityCode=false;
var ajaxsubmit=function(){//当验证码校验成功后，执行该函数
	identityCode=true;
}

var seajaxsubmit= document.getElementById("code_input");
seajaxsubmit.addEventListener("blur", function(e) {
	var res = verifyCode.validate(document.getElementById("code_input").value);
	if(res){
		identityCode=true;
		alert("验证码校验成功");
	}else{
		alert("验证码错误");
	}
});

checkpassword.onpaste=function(){return false};
checkpassword.oncut=function(){return false};
checkpassword.oncopy=function(){return false};

var submit=document.getElementById("registeButton");
submit.addEventListener("click", function(e) {
	var form=document.getElementById("form");
	if(userRegiste==false){
		alert("用户名格式错误，请输入正确的用户名");
	}else if(emailRegiste==false){
		alert("邮箱格式错误，请输入正确的邮箱");
	}else if(passwordRegiste==2){
		alert("密码不能为空");
	}else if(passwordRegiste==3){
		alert("密码不能为空");
	}else if(passwordRegiste==4){
		alert("密码不能小于6位或大于20位");
	}else if(passwordRegiste==5){
		alert("密码不能全是数字");
	}else if(checkpasswordRgiste==false){
		alert("两次密码输入不一致");
	}else if(!identityCode){
		alert("请进行验证码校验");
	}else{
		//进行Ajaxt提交，注册
		//收集注册信息
		//使用原生js代码进行提交
	    //创建对象
	    var xmlhttp;
	    if(window.XMLHttpRequest){
	        xmlhttp = new XMLHttpRequest();
	    }else{
	        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	    }
	    //传入回调函数onreadystatechange
	    xmlhttp.onreadystatechange=function(){
	        if(xmlhttp.readyState==4 && xmlhttp.status==200){//请求成功
	        	if(xmlhttp.responseText>0){
	        		//var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
	        		//setTimeout(function(){
	        			alert("注册成功");
	        			window.location.href="login.jsp";
	        		//},3000);
	        	}else{
	        		layer.open({
	        			  type: 1,
	        			  shade: false,
	        			  title: false, //不显示标题
	        			  content: $('.layer_notice'), //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
	        			  cancel: function(){
	        			    layer.msg('系统错误，请稍后重试', {time: 5000, icon:6});
	        			  }
	        			});
	        	}
	        }
	    }
	    //发送请求
	    xmlhttp.open("POST","register.htgo",true);
	    //如果希望通过POST传输数据，那么应该先通过setRequestHeader()添加Http头数据
	    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    xmlhttp.send("regName="+user.value+"&password="+password.value+"&email="+email.value);
	}
}, true)
</script>
</html>