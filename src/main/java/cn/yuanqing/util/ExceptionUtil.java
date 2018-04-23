package cn.yuanqing.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 用来收集异常日志
 *
 *    JavaEE  web阶段
 *
 *    当产生异常时, 应把异常收集起来 ,
 *
 *        存储到
 *            本地文件
 *            网络存储
 *            短信发送
 *            邮件
 */
public class ExceptionUtil {

    /**
     * 
     * 存储: 
     *     在存储的目录下 ,按照每天的日期创建单独文件夹
     * 
     *                 每天的文件夹中, 异常日志存储的文件, 一个异常一个文件, 文件名称按照时-分-秒-毫秒的格式存储
     *         
     * 
     * @param e 要存储的异常信息
     * @param exceptionPath 要存储的位置: 是一个文件夹, 文件夹可以不存在
     * @throws Exception 
     */
    public static void toException(Exception e,File exceptionPath) throws Exception{
        if(!exceptionPath.exists()){
            //创建文件夹
            exceptionPath.mkdirs();
        }
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String day = sdf.format(date);
        //创建每天的异常文件夹
        File dayDir = new File(exceptionPath, day);
        if(!dayDir.exists())
            dayDir.mkdirs();
        //创建本次异常存储的文件
        SimpleDateFormat sdf2 = new SimpleDateFormat("HH-mm-ss-sss");
        
        String fileName = sdf2.format(date);
        File file = new File(dayDir, fileName+".txt");
        //创建一个字符打印流 , 指向创建的这个文件
        PrintWriter pw = new PrintWriter(new FileOutputStream(file));
        //将异常信息输出至这个文件
        e.printStackTrace(pw);
        pw.close();
    }
    /**
     * 
     * @param e 要存储的异常信息 , 存储的位置 ,在F://log文件夹中
     */
    public static void toException(Exception e){
        try {
            toException(e,new File("F://log"));
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
    }
    
    
}