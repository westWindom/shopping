package cn.yuanqing.test;


import java.util.HashMap;
import java.util.Map;

import cn.yuanqing.dao.UserDao;
import cn.yuanqing.pojo.AdminInfo;
import cn.yuanqing.pojo.UserInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class DispatcherServletTest {

	@Test
	public void testname1() throws Exception {
		ApplicationContext ac=new ClassPathXmlApplicationContext("dispatcherServlet.xml");
		SqlSessionFactory factory= ac.getBean("ssf",SqlSessionFactory.class);
		SqlSession session = factory.openSession();
		UserDao mapper = session.getMapper(UserDao.class);
		System.out.println(session.getConnection());
	}
	
	@Test
	public void testName2() throws Exception {
		MapperScannerConfigurer c;
		ApplicationContext ac=new ClassPathXmlApplicationContext("dispatcherServlet.xml");
		UserDao userDao = ac.getBean("userMapper",UserDao.class);
		Map<String,String> map=new HashMap<String,String>();
//		map.put("name", "吴兴国");
//		map.put("password", "123456");
//		UserInfo login = userDao.login(name,password);
		//System.out.println(login);
		AdminInfo a=new AdminInfo();
	}
} 
