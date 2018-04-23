package cn.yuanqing.test;


import cn.yuanqing.dao.UserDao;
import cn.yuanqing.pojo.UserInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class ConnecPoolTest {
	@Autowired
	private UserDao userDao;

	@Test
	public void testName(){
        UserInfo jame = userDao.login("jame", "123456");
        System.out.println(jame);
	}
}
