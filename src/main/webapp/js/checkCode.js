(function(){
	$.fn.checkCode=function(){
        var strCode =${strCode!""};//这里用的freemarke取到后台保存在session中的验证码字符。
        var inpCode =$('#authCode').val();
        if(strCode==""||strCode == null){
            chageCode();
            //用后台的字符与页面输入的验证码进行比较
        }else if(inpCode == strCode){
            return true;
        }else{
            return false;
        }
	}
})