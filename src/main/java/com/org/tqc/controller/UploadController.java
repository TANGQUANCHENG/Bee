package com.org.tqc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by 唐全成 on 2016/11/9.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/uploadController")
public class UploadController {

    @RequestMapping(value="/baiduWebUpload")
    @ResponseBody
    public ModelAndView baiduWebUpload(){
        ModelAndView md= new ModelAndView("/upload");
        return md;
    }

    @RequestMapping(value="/dropZone")
    @ResponseBody
    public ModelAndView dropZone(){
        ModelAndView md= new ModelAndView("/dropZone");
        return md;
    }

    @RequestMapping(value="/editAvatar")
    @ResponseBody
    public ModelAndView editAvatar(){
        ModelAndView md= new ModelAndView("/editAvatar");
        return md;
    }
}
