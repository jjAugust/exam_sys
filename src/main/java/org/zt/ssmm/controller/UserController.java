package org.zt.ssmm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zt.ssmm.core.Returntype;
import org.zt.ssmm.core.Tm;
import org.zt.ssmm.core.User;
import org.zt.ssmm.service.UserService;
import org.zt.ssmm.util.ReturnUtil;

@Controller
@RequestMapping("/userController")
public class UserController 
{
	@Autowired
	private UserService us;


	@ResponseBody
	@RequestMapping("/showUser")
	public Object showUser(String id, HttpServletRequest req,HttpSession httpSession)
	{
		User u = us.getUserById( (Integer)req.getSession().getAttribute("id"));
		req.setAttribute("user", u);
		Returntype text=new Returntype();
		ReturnUtil.fix(text,"_KEYS_s01");
		text.setData(u);
		return text;  
	}

	@RequestMapping("/test")
	@ResponseBody  
	public Object test(String id, HttpServletRequest req)
	{
		Returntype text=new Returntype();
		List<Tm> u = us.getTm();

		ReturnUtil.fix(text,"_KEYS_s04");
		text.setData(u);
		return text;  

	}

	@RequestMapping("/submit")
	@ResponseBody  
	public Object submit(String id,String answer, HttpServletRequest req)
	{
		Returntype text=new Returntype();
		List<Tm> u = us.getTm2();
		String[] i=id.split(";");
		String[] j=answer.split(";");
		String wrong = "";
		int index=1;
		int p1;
		int p2;
		String p3;
		String p4;
		for(int p=0;p<i.length;p++){
			for(int q=0;q<i.length;q++){
				p1=u.get(q).getId();
				p2=Integer.valueOf(i[p]);
				p3=u.get(q).getZhengque();
				p4=j[p];
				if(p1==p2){
					if(p3.equals(p4)){
					}
					else{
						if(index==1){
							wrong=""+u.get(q).getId();
							index=2;
						}
						else{
							wrong=wrong+";"+u.get(q).getId();
						}
						
					}
				}
			}
		}
		ReturnUtil.fix(text,"_KEYS_s04");
		text.setData(wrong);
		return text;  

	}

	@RequestMapping("/deleteUser")
	@ResponseBody  
	public Object deleteUser(String id, HttpServletRequest req)
	{
		Returntype text=new Returntype();
		Integer i=0;
		i=us.deleteUserAndPassword(Integer.valueOf(id));
		if(i==1){

			ReturnUtil.fix(text,"_KEYS_s03");
			return text;  
		}
		else{

			ReturnUtil.fix(text,"_KEYS_f04");
			return text;  
		}
	}




	@RequestMapping("/addUser")
	@ResponseBody  
	public Object addUser(String name,String password,String birthdate,String occupation,String phone,HttpServletRequest req,HttpSession session,String telcode) throws ParseException
	{

		SimpleDateFormat f=new SimpleDateFormat("yyyy-mm-dd"); 
		Returntype text=new Returntype();
		User role = new User();
		role.setName(name);
		role.setPassword(password);
		role.setBirthdate(f.parse(birthdate));
		role.setOccupation(occupation);
		role.setPhone(phone);

		//先查询是否已用了该登录名 否则需提示
		Integer j=0;
		j=us.selectUser(name);
		if(j>=1){
			ReturnUtil.fix(text,"_KEYS_f02");
			return text;  
		}

		else{
			Integer i=0;
			i=us.insertUserAndPassword(role);
			if(i==1){
				ReturnUtil.fix(text,"_KEYS_s02");
				return text;  
			}
			else{
				ReturnUtil.fix(text,"_KEYS_f03");
				return text;  
			}
		}
	}


	public UserService getUs() {
		return us;
	}

	public void setUs(UserService us) {
		this.us = us;
	}
}
