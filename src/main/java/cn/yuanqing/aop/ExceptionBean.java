package cn.yuanqing.aop;
import java.io.PrintStream;

import cn.yuanqing.pojo.Mail;
import cn.yuanqing.util.MailUtil;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


/**
 * 异常监测
 * @author yq
 *
 */
@Component
@Aspect
public class ExceptionBean {

	/**
	 * 当程序抛出异常的时候，就向我发邮箱<br/>
	 * 这里可以选择把异常信息存储到本地中，不过考虑到购买的虚拟机的大小，所以这里就只是向我邮箱通知。
	 * @param e
	 */
    @AfterThrowing(throwing="e",pointcut="within(cn.yuanqing.controller..*)")
    public void ExceptionCollection(Exception e){
//        ExceptionUtil.toException(e);
        Mail mail = new Mail();
        mail.setHost("smtp.qq.com");           //设置邮件服务器,如果不用QQ邮箱的,自己找找看相关的
        mail.setPortNumber("465");             //设置邮件服务器端口号,默认25，如果是QQ发送，就不要更改了。 
        mail.setSender("595831329@qq.com");             //发送人
        mail.setName("网上购物商城");                    //发送人昵称
        mail.setReceiver("595831329@qq.com");           //接收人
        mail.setUsername("595831329@qq.com");           //登录账号,一般都是和邮箱名一样
        mail.setPassword("ofineycqdomvdgfe");  //QQ邮箱登录第三方客户端时,密码框请输入“授权码”进行验证。其他的密码具体查看邮件服务器的说明
        mail.setSubject("回头购商城异常信息报告");
        mail.setMessage(getExceptionDetail(e).toString()); //把栈信息发送出去
        if (new MailUtil().send(mail)) {
            System.out.println("发送成功");  
       } else {  
            System.out.println("发送失败");  
       }	
    }
    /**
     * 用于将栈中的信息输出到StringBudffer中
     * @param e 异常对象
     * @return 一个StringBuffer的对象，表示异常栈中的信息
     */
    public StringBuffer getExceptionDetail(Exception e){
    	StringBuffer str=new StringBuffer();
    	PrintStream pw=null;
    	StackTraceElement[] stackTraces = e.getStackTrace();
    	for(StackTraceElement stackTrace:stackTraces){
    		str.append(stackTrace.toString()+"\n \n");
    	}
    	return str;
    }
}
