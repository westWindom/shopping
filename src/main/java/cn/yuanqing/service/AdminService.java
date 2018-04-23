package cn.yuanqing.service;

import javax.annotation.Resource;

import cn.yuanqing.dao.AdminDao;
import cn.yuanqing.pojo.AdminInfo;
import org.springframework.stereotype.Service;



@Service
public class AdminService {

	@Resource
	AdminDao adminDao;
	
	public AdminInfo queryadmin(AdminInfo admininfo){
		AdminInfo admin=new AdminInfo();
		try{
		admin = adminDao.queryadmin(admininfo);
		}catch(Exception e){
			e.printStackTrace();
			admin=null;
		}
		return admin;
	}
}
