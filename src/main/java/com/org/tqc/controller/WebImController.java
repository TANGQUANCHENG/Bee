package com.org.tqc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by 唐全成 on 2016/11/8.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/webImController")
public class WebImController {

    @RequestMapping(value="/webIm")
    @ResponseBody
    public ModelAndView articleList(){
        ModelAndView md= new ModelAndView("/webim");
        return md;
    }
}
