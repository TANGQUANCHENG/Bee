package com.org.tqc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/angularController")
public class AngularController {

    @RequestMapping(value="/angularList")
    @ResponseBody
    public ModelAndView angularList(){
        ModelAndView md= new ModelAndView("/testAngular");
        return md;
    }
}
