package com.org.tqc.controller;

import com.org.tqc.entity.Customer;
import com.org.tqc.entity.User;
import com.org.tqc.service.impl.UserServiceImpl;
import com.org.tqc.util.CommenUtil;
import com.org.tqc.util.MessageBean;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.org.tqc.service.UserService;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionEvent;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/userinfo")
public class UserController {
    @Resource
    private UserService userService;

    private static final Logger LOG = Logger.getLogger(UserController.class);
    @RequestMapping(value = "/{id}")
    @ResponseBody
    public User test(@PathVariable Long id, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("user_id", id);
        User u = userService.selectUser(paramMap);
        System.out.println(u.getUserName());
        return u;
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public MessageBean login(User user, HttpServletRequest request) {
        if (user == null) {
            MessageBean m = new MessageBean();
            m.setMessage("数据异常！");
            m.setSuccess(false);
            return m;
        }
        if(user.getUserName()==null|| StringUtils.isBlank(user.getUserName())){
            MessageBean m = new MessageBean();
            m.setMessage("请输入用户名！");
            m.setSuccess(false);
            return m;
        }
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userName", user.getUserName());

        return userService.checkUserExist(paramMap, user,request);
    }


    @RequestMapping(value="/profile")
    @ResponseBody
    public ModelAndView myProfile(HttpServletRequest request){
        ModelAndView md= new ModelAndView("/profile");
        User user=(User)request.getSession().getAttribute("userinfo");
        md.addObject("userinfo",user);
        return md;
    }

    @RequestMapping(value="/allUsers")
    @ResponseBody
    public ModelAndView showAllUsers(HttpServletRequest request){
        ModelAndView md= new ModelAndView("/allUsers");
        md.addObject("allUsers",userService.getAllUsers());
        return md;
    }

    @RequestMapping(value="/forward")
    @ResponseBody
    public static ModelAndView forward(HttpSessionEvent httpSessionEvent){
        ModelAndView md= new ModelAndView("/forward");
        User user=(User)httpSessionEvent.getSession().getAttribute("userinfo");
        md.addObject("loginUser",user);
        return md;
    }

    @RequestMapping(value="/updateUser")
    @ResponseBody
    public ModelAndView updateUser(User user){
        Map<String, Object> paramMap;

        paramMap = CommenUtil.beanToMap(user);
        userService.updateUser(paramMap);
        return new ModelAndView("redirect:/userinfo/allUsers");
    }

    @RequestMapping(value="/addUser")
    @ResponseBody
    public ModelAndView addUser(User user){
        Map<String, Object> paramMap;

        paramMap = CommenUtil.beanToMap(user);
        userService.addeUser(paramMap);
        return new ModelAndView("redirect:/userinfo/allUsers");
    }

    @RequestMapping("/logout")
    public ModelAndView loginOut() {
        LOG.warn("用户："+SecurityUtils.getSubject().getPrincipal()+"-->下线");
        SecurityUtils.getSubject().logout();//退出
        return new ModelAndView("redirect:/index.jsp");
    }


}
