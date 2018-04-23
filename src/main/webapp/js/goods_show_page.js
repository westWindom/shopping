/**
 * goodsdetail.jsp页面的js文件
 */
function countCategory(count){
	var countstr="";
	switch (count) {
	case 1:
		countstr="数码 > ";
		break;
	case 2:
		countstr="手机 > ";
		break;
	case 3:
		countstr="电脑 > ";
		break;
	case 4:
		countstr="DIY > ";
		break;
	case 5:
		countstr="外设 > ";
		break;
	case 6:
		countstr="智能 > ";
	default:
		countstr="其它 > "
		break;
	}
	return countstr;
}

function checkproductamount(){
	var product_amount_value=document.getElementById("product_amount_num").value;
	if(/[^0123456789]/g.test(product_amount_value) || /^0/g.test(product_amount_value)){
		//输入不合格
		alert("请输入合法的数字");
		document.getElementById("product_amount_num").value=1;
	}else{
		//输入合格
	}
}

function increaseCount(){
	var product_amount=document.getElementById("product_amount_num");
	var product_amount_num=new Number(product_amount.value);
	product_amount.value=(product_amount_num+1);
	var product_bottom_patt_id=document.getElementById("reproduct_bottom_patt_id");
	if(product_bottom_patt_id!=null){
	  product_bottom_patt_id.id="product_bottom_patt_id";
	}
}
function descreaseCount(){
	var product_amount=document.getElementById("product_amount_num");
	var product_amount_num=new Number(product_amount.value);
	var proamonum=product_amount_num-1;
	if(proamonum==1){
		var product_bottom_patt_id=document.getElementById("product_bottom_patt_id");
		if(product_bottom_patt_id!=null){
		  product_bottom_patt_id.id="reproduct_bottom_patt_id";
		}
		product_amount.value=(proamonum);
	}else if(proamonum>1){
		product_amount.value=(proamonum);
	}
}





var headcollectgoods=document.getElementById("headcollectgoods");
headcollectgoods.addEventListener("click",function()
{
	var collection=document.getElementById("collectionPage");
	var title=document.title;
	var url=document.location.href;
	try{
		window.external.AddFavorite(url,title);
		alert("商品书签已经成功添加");
	}catch(err){
		alert("您的浏览器不支持自动添加书签,请通过Ctr+S手动添加");
	}
}
)
var gradevalue=document.getElementById("gradevalue");
var gradeNumber=Math.round(anglePercentage*100);
if(totalcomments!=0){
	gradevalue.innerHTML=gradeNumber+"%";
}else{
	gradevalue.innerHTML="<span style='font-size:11px'>抢沙发了</span>"
}
var c=document.getElementById("myCanvas");
var ctx=c.getContext("2d");
ctx.beginPath();
ctx.lineWidth=10;
ctx.strokeStyle="gray";
ctx.arc(63,58,50,0,2*Math.PI);
ctx.fillStyle="#FBFBFB";
ctx.fill();
ctx.stroke();
ctx.beginPath();
ctx.translate(63,58);
ctx.rotate(-90*Math.PI/180);
ctx.strokeStyle="#FFCFCF";
ctx.arc(0,0,50,0,2*Math.PI*anglePercentage);
ctx.stroke();
c.addEventListener("mouseover", function(e) {
	gradevalue.innerHTML=0+"%";
	ctx.beginPath();
	ctx.strokeStyle="gray";
	ctx.arc(0,0,50,0,2*Math.PI);
	ctx.stroke();
	var finish=anglePercentage;
	var step=0;
	var internal=setInterval(function(e) {
		if(step<finish){
		step=step+0.01;
		ctx.beginPath();
	    ctx.strokeStyle="#FFCFCF";
	    ctx.arc(0,0,50,0,2*Math.PI*step);
	    ctx.stroke();
	    gradevalue.innerHTML=Math.round(step*100)+"%";
		}else{
		clearInterval(internal);
		}
	}, 0.5)
	}, true)
var classifybox1=document.getElementById("classifybox1");
var classifytext1=document.getElementById("classifytext1");
var classifypattexternal1=document.getElementById("classifypattexternal1");
var classifypattinternal1=document.getElementById("classifypattinternal1");
classifypattinternal1.style.borderColor="red";
classifypattinternal1.style.background="red";
classifypattexternal1.style.borderColor="red";
classifytext1.style.borderColor="red";
classifybox1.style.color="red";
var classifybox2=document.getElementById("classifybox2");
var classifytext2=document.getElementById("classifytext2");
var classifypattexternal2=document.getElementById("classifypattexternal2");
var classifypattinternal2=document.getElementById("classifypattinternal2");
var classifybox3=document.getElementById("classifybox3");
var classifytext3=document.getElementById("classifytext3");
var classifypattexternal3=document.getElementById("classifypattexternal3");
var classifypattinternal3=document.getElementById("classifypattinternal3");
var classifybox4=document.getElementById("classifybox4");
var classifytext4=document.getElementById("classifytext4");
var classifypattexternal4=document.getElementById("classifypattexternal4");
var classifypattinternal4=document.getElementById("classifypattinternal4");
var allcontent=document.getElementById("allcontent");
var goodcontents=document.getElementById("goodcontents");
var middlecontent=document.getElementById("middlecontent");
var worstContent=document.getElementById("worstContent");
classifybox1.addEventListener("click",function(){
	classifypattinternal1.style.borderColor="red";
	classifypattinternal1.style.background="red";
	classifypattexternal1.style.borderColor="red";
	classifytext1.style.borderColor="red";
	classifybox1.style.color="red";
	classifypattinternal2.style.borderColor="black";
	classifypattinternal2.style.background="black";
	classifypattexternal2.style.borderColor="black";
	classifytext2.style.borderColor="black";
	classifybox2.style.color="black";
	classifypattinternal3.style.borderColor="black";
	classifypattinternal3.style.background="black";
	classifypattexternal3.style.borderColor="black";
	classifytext3.style.borderColor="black";
	classifybox3.style.color="black";
	classifypattinternal4.style.borderColor="black";
	classifypattinternal4.style.background="black";
	classifypattexternal4.style.borderColor="black";
	classifytext4.style.borderColor="black";
	classifybox4.style.color="black";
	allcontent.style.display="block";
	goodcontents.style.display="none";
	middlecontent.style.display="none";
	worstContent.style.display="none";
},true)
classifybox2.addEventListener("click",function(){
	classifypattinternal1.style.borderColor="black";
	classifypattinternal1.style.background="black";
	classifypattexternal1.style.borderColor="black";
	classifytext1.style.borderColor="black";
	classifybox1.style.color="black";
	classifypattinternal2.style.borderColor="red";
	classifypattinternal2.style.background="red";
	classifypattexternal2.style.borderColor="red";
	classifytext2.style.borderColor="red";
	classifybox2.style.color="red";
	classifypattinternal3.style.borderColor="black";
	classifypattinternal3.style.background="black";
	classifypattexternal3.style.borderColor="black";
	classifytext3.style.borderColor="black";
	classifybox3.style.color="black";
	classifypattinternal4.style.borderColor="black";
	classifypattinternal4.style.background="black";
	classifypattexternal4.style.borderColor="black";
	classifytext4.style.borderColor="black";
	classifybox4.style.color="black";
	allcontent.style.display="none";
	goodcontents.style.display="block";
	middlecontent.style.display="none";
	worstContent.style.display="none";
},true)
classifybox3.addEventListener("click",function(){
	classifypattinternal1.style.borderColor="black";
	classifypattinternal1.style.background="black";
	classifypattexternal1.style.borderColor="black";
	classifytext1.style.borderColor="black";
	classifybox1.style.color="black";
	classifypattinternal2.style.borderColor="black";
	classifypattinternal2.style.background="black";
	classifypattexternal2.style.borderColor="black";
	classifytext2.style.borderColor="black";
	classifybox2.style.color="black";
	classifypattinternal3.style.borderColor="red";
	classifypattinternal3.style.background="red";
	classifypattexternal3.style.borderColor="red";
	classifytext3.style.borderColor="red";
	classifybox3.style.color="red";
	classifypattinternal4.style.borderColor="black";
	classifypattinternal4.style.background="black";
	classifypattexternal4.style.borderColor="black";
	classifytext4.style.borderColor="black";
	classifybox4.style.color="black";
	allcontent.style.display="none";
	goodcontents.style.display="none";
	middlecontent.style.display="block";
	worstContent.style.display="none";
},true)
classifybox4.addEventListener("click",function(){
	classifypattinternal1.style.borderColor="black";
	classifypattinternal1.style.background="black";
	classifypattexternal1.style.borderColor="black";
	classifytext1.style.borderColor="black";
	classifybox1.style.color="black";
	classifypattinternal2.style.borderColor="black";
	classifypattinternal2.style.background="black";
	classifypattexternal2.style.borderColor="black";
	classifytext2.style.borderColor="black";
	classifybox2.style.color="black";
	classifypattinternal3.style.borderColor="black";
	classifypattinternal3.style.background="black";
	classifypattexternal3.style.borderColor="black";
	classifytext3.style.borderColor="black";
	classifybox3.style.color="black";
	classifypattinternal4.style.borderColor="red";
	classifypattinternal4.style.background="red";
	classifypattexternal4.style.borderColor="red";
	classifytext4.style.borderColor="red";
	classifybox4.style.color="red";
	allcontent.style.display="none";
	goodcontents.style.display="none";
	middlecontent.style.display="none";
	worstContent.style.display="block";
},true)
var tempcommentcontent=null;
var commentsnum=document.getElementById("commentsnum");
var commentcontent=document.getElementById("commentcontent");
commentcontent.addEventListener("keypress",function(e){
	var tempcommentnum=200-commentcontent.value.length;
	if(tempcommentnum==1){
		alert("字数最多200");
		tempcommentcontent=commentcontent.value;
	}else if(tempcommentnum<1){
		commentcontent.value=tempcommentcontent;
	}
	else{
		commentsnum.innerHTML=tempcommentnum;
	}
},true)
function textsubmit(){
	if(commentcontent.value.length!=0){
		document.getElementById("formtext").action="usercomments.htgo";		
	}else{
		alert("评论不能为空");
	}
}