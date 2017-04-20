package com.org.tqc.service;

import com.org.tqc.entity.User;
import com.org.tqc.util.MessageBean;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface UserService {
    /**
     * 根据id查询用户
     * @param map
     * @return
     */
    User selectUser(Map<String,Object> map);

    /**
     * 根据姓名查询用户，并判断该用户是否存在
     * @param map
     * @param user
     * @return
     */
    MessageBean checkUserExist(Map<String,Object> map, User user, HttpServletRequest request);

    /**
     * 查询所有用户
     * @return
     */
    List<User> getAllUsers();
    /**
     * 修改所有用户
     * @return
     */
    void updateUser(Map<String,Object> map);

    /**
     * 新增
     * @return
     */
    void addeUser(Map<String,Object> map);
}
