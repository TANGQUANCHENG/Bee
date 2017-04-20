package com.org.tqc.dao;

import com.org.tqc.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface UserDao {
     User selectUser(Map<String,Object> map);

     User selectUserByName(Map<String,Object> map);

     List<User> selectAllUsers();

     void updateUser(Map<String,Object> map);

     void addUser(Map<String,Object> map);
}
