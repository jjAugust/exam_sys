package org.zt.ssmm.dao;

import java.util.List;

import org.zt.ssmm.core.Tm;
import org.zt.ssmm.core.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);
    int insert2(User role);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    List<Tm> getTm();
    List<Tm> getTm2();
    List<User> getAllUsers();
    
    List<User> getAllUsersWithRole();
    int selectUser(String name);
    int selectPhoneToday(String phoneNum);
    int insertPhoneToday(String phoneNum);
    
    User selectByNamePWD(User role);
}