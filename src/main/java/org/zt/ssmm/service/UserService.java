package org.zt.ssmm.service;

import java.util.List;

import org.zt.ssmm.core.Tm;
import org.zt.ssmm.core.User;

public interface UserService 
{
	User getUserById(Integer id);
	List<User> getAllUsers();
	List<User> getAllUsersWithRole();
	int deleteUserAndPassword(int record);
	int insertUserAndPassword(User role);
	int selectUser(String name);
	User selectByNamePWD(User role);
	List<Tm> getTm();
	List<Tm> getTm2();
}