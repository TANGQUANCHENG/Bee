package com.org.tqc.controller;

import com.org.tqc.entity.Article;
import com.org.tqc.entity.CalendarEvent;
import com.org.tqc.entity.User;
import com.org.tqc.entity.UserEvent;
import com.org.tqc.service.CalendarEventService;
import com.org.tqc.service.UserEventService;
import com.org.tqc.util.CommenUtil;
import com.org.tqc.util.MessageBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/11/3.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/calendarController")
public class CalendarController {

    @Resource
    private CalendarEventService calendarEventService;
    @Resource
    private UserEventService userEventService;

    @RequestMapping(value = "/calendar")
    @ResponseBody
    public ModelAndView articleList(HttpServletRequest request) {
        ModelAndView md = new ModelAndView("/calendar");
        Map<String, Object> paramMap = new HashMap<String, Object>();

        User user = (User) request.getSession().getAttribute("userinfo");
        if (user == null) {
            Map<String, Object> m = new HashMap<String, Object>();
            m.put("eventJSON","0");
            md.addObject("calendarJSON", m);
        } else {
            paramMap.put("userId", user.getUser_id());
            md.addObject("allCalendarEvents", calendarEventService.findAllCalendarEvent(paramMap));
            UserEvent ue = userEventService.findUserEventByUserId(paramMap);
            if (ue == null) {
                UserEvent u = new UserEvent();
                u.setEventJSON("0");
                u.setUserId(user.getUser_id());
                Map<String, Object> m = CommenUtil.beanToMap(u);
                userEventService.addUserEvent(m);
            }
            md.addObject("calendarJSON", userEventService.findUserEventByUserId(paramMap));
        }
        return md;
    }

    @RequestMapping(value = "/reloadEvents")
    @ResponseBody
    public List<CalendarEvent> reloadEvents(HttpServletRequest request) {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        User user = (User) request.getSession().getAttribute("userinfo");

        if(user==null){
            return null;
        }
        paramMap.put("userId", user.getUser_id());

        List<CalendarEvent> eventList = calendarEventService.findAllCalendarEvent(paramMap);
        return eventList;
    }

    @RequestMapping(value = "/addEvent")
    @ResponseBody
    public MessageBean addEvent(CalendarEvent calendarEvent,HttpServletRequest request) {
        MessageBean m = new MessageBean();
        Map<String, Object> paramMap;
        User user = (User) request.getSession().getAttribute("userinfo");
        if(user==null){
            return MessageBean.fail("获取用户信息失败！");
        }
        calendarEvent.setUserId(user.getUser_id());
        try {
            paramMap = CommenUtil.beanToMap(calendarEvent);
            calendarEventService.addCalendarEvent(paramMap);
            m.setSuccess(true);
            m.setMessage("新增成功");
        } catch (Exception e) {
            m.setSuccess(false);
            m.setMessage("新增失败");
            e.printStackTrace();
        }
        return m;
    }

    @RequestMapping(value = "/deleteEvent/{id}")
    @ResponseBody
    public MessageBean deleteEvent(@PathVariable Long id) {
        MessageBean m = new MessageBean();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        try {
            calendarEventService.deleteCalendarEvent(paramMap);
            m.setSuccess(true);
            m.setMessage("删除成功");
        } catch (Exception e) {
            m.setSuccess(false);
            m.setMessage("删除失败");
            e.printStackTrace();
        }
        return m;
    }

    @RequestMapping(value = "/updateEvent")
    @ResponseBody
    public MessageBean updateEvent(String eventJSON,HttpServletRequest request) {
        MessageBean m = new MessageBean();
        Map<String, Object> paramMap = new HashMap<String, Object>();
        User user = (User) request.getSession().getAttribute("userinfo");
        if(user==null){
            m.setSuccess(false);
            m.setMessage("获取用户信息失败");
            return m;
        }
        if(eventJSON.length()<5){
            eventJSON="0";
        }
        paramMap.put("eventJSON", eventJSON);
        paramMap.put("userId", user.getUser_id());
        try {
            userEventService.updateUserEvent(paramMap);
            m.setSuccess(true);
            m.setMessage("数据库同步成功");
        } catch (Exception e) {
            m.setSuccess(false);
            m.setMessage("数据库同步失败");
            e.printStackTrace();
        }
        return m;
    }
}
