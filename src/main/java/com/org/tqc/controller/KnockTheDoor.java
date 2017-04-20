package com.org.tqc.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/bee")
public class KnockTheDoor {

    @RequestMapping(value="/index")
    @ResponseBody
    public ModelAndView showDashboard(){
        ModelAndView md= new ModelAndView("/index");
        return md;
    }


    @RequestMapping(value="/datas")
    @ResponseBody
    public ModelAndView showDashboardDatas(){
        ModelAndView md= new ModelAndView("/index_data");
        return md;
    }
}
