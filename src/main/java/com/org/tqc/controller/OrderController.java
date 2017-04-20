package com.org.tqc.controller;

import com.org.tqc.entity.OperateLog;
import com.org.tqc.service.OperateLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dxkj on 2016/11/25.
 */

@RestController
@RequestMapping("/orderController")
public class OrderController {
    @Resource
    private OperateLogService operateLogService;

    @RequestMapping(value="/orderList")
    public ModelAndView articleList(){
        ModelAndView md= new ModelAndView("/orderManage");
        return md;
    }
    @RequestMapping(value="/getLogs")
    public List<OperateLog> getLogs(){
        return operateLogService.findAllOperateLogs();
    }
}
