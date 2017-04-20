package com.org.tqc.controller;

import com.org.tqc.service.TopicService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/topicController")
public class TopicController {
    @Resource
    private TopicService topicService;

    @RequestMapping(value="/topicList")
    @ResponseBody
    public ModelAndView myProfile(HttpServletRequest request){
        ModelAndView md= new ModelAndView("/forum_main");
        md.addObject("allTopics",topicService.findAllTopics());
        return md;
    }
}
