package com.org.tqc.service.impl;

import com.org.tqc.dao.UserDao;
import com.org.tqc.entity.User;
import com.org.tqc.service.UserService;
import com.org.tqc.util.MessageBean;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Transactional
    @Override
    public User selectUser(Map<String, Object> map) {
        return userDao.selectUser(map);
    }


    private static final Logger LOG = Logger.getLogger(UserServiceImpl.class);

    @Override
    public MessageBean checkUserExist(Map<String, Object> map, User user, HttpServletRequest request) {
        MessageBean m=new MessageBean();

        User u=userDao.selectUserByName(map);

        if(u==null){
            m.setMessage("此用户不存在！");
            m.setSuccess(false);
            return m;
        }
        if(u.getUserName()==null||u.getUserName().equals("")||!u.getUserName().equals(user.getUserName())){
            m.setMessage("系统发生了错误！");
            m.setSuccess(false);
            return m;
        }
        if(!u.getPassword().equals(user.getPassword())){
            m.setMessage("您输入的密码错误！");
            m.setSuccess(false);
            return m;
        }
        request.getSession().setAttribute("userinfo",u);
        SecurityUtils.getSubject().login(new UsernamePasswordToken(String.valueOf(user.getUserName()), user.getPassword()));//把登陆信息放入shrio中
        m.setSuccess(true);
        m.setMessage("登陆成功");
        LOG.warn("用户："+u.getUserName()+"-->登录成功");
        return m;
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.selectAllUsers();
    }

    @Override
    public void updateUser(Map<String, Object> map) {
        userDao.updateUser(map);
    }

    @Override
    public void addeUser(Map<String, Object> map) {
        userDao.addUser(map);
    }
}
