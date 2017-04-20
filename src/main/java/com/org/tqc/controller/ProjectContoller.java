package com.org.tqc.controller;

import com.org.tqc.entity.Project;
import com.org.tqc.entity.User;
import com.org.tqc.service.ProjectService;
import com.org.tqc.service.UserService;
import com.org.tqc.util.CommenUtil;
import com.org.tqc.util.MessageBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/11/15.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/projectController")
public class ProjectContoller {
    @Resource
    private ProjectService projectService;
    @Resource
    private UserService userService;

    @RequestMapping(value = "/projectList")
    @ResponseBody
    public ModelAndView projectList(HttpServletRequest request) {
        ModelAndView md = new ModelAndView("/projects");
        md.addObject("allProjects", projectService.findAllProject());
        md.addObject("allUsers",userService.getAllUsers());
        return md;
    }

    @RequestMapping(value = "/projectDetail/{id}")
    @ResponseBody
    public ModelAndView projectDetail(@PathVariable Long id) {
        ModelAndView md = new ModelAndView("/projectDetail");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id", id);
        Project p = projectService.findProjectById(paramMap);
        if (p == null) {
            ModelAndView er = new ModelAndView("/error");
            return er;
        }
        int mid = p.getManagerId();

        if (!(mid == 0)) {

            paramMap.put("user_id", mid);

            User u = userService.selectUser(paramMap);

            p.setManager(u);
        }
        md.addObject("project", p);
        return md;
    }

    @RequestMapping(value = "/projectInfo/{id}")
    @ResponseBody
    public Project projectInfo(@PathVariable Long id) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("id", id);
        Project p = projectService.findProjectById(paramMap);
        if (p == null) {
            return null;
        }
        int mid = p.getManagerId();

        if (!(mid == 0)) {

            paramMap.put("user_id", mid);

            User u = userService.selectUser(paramMap);

            p.setManager(u);
        }
        return p;
    }

    @RequestMapping(value = "/toAddProject")
    @ResponseBody
    public ModelAndView toAddProject() {
        ModelAndView md = new ModelAndView("/addProject");
        return md;
    }

    @RequestMapping(value = "/addProject")
    @ResponseBody
    public MessageBean addEvent(Project project) {
        MessageBean m = new MessageBean();
        Map<String, Object> paramMap;
        project.setCreateTime(new Date());
        try {
            paramMap = CommenUtil.beanToMap(project);
            int pid = projectService.addProject(paramMap);
            System.out.println(paramMap.toString());
            m.setBean(paramMap.get("id"));
            m.setSuccess(true);
            m.setMessage("新增成功");
        } catch (Exception e) {
            m.setSuccess(false);
            m.setMessage("新增失败");
            e.printStackTrace();
        }
        return m;
    }


    @RequestMapping(value = "/updateDescription")
    @ResponseBody
    public MessageBean updateDescription(Project project) {
        MessageBean m = new MessageBean();
        Map<String, Object> paramMap;

        try {
            paramMap = CommenUtil.beanToMap(project);
            int pid = projectService.updateDescription(paramMap);
            System.out.println(paramMap.toString());
            m.setBean(paramMap.get("id"));
            m.setSuccess(true);
            m.setMessage("保存成功");
        } catch (Exception e) {
            m.setSuccess(false);
            m.setMessage("保存失败");
            e.printStackTrace();
        }
        return m;
    }

    @RequestMapping(value = "/updateBasicInfo")
    @ResponseBody
    public ModelAndView updateBasicInfo(Project project) {
        Map<String, Object> paramMap;
        project.setUpdateTime(new Date());
        paramMap = CommenUtil.beanToMap(project);
        System.out.println(paramMap);

        projectService.updateProjectInfo(paramMap);

        return new ModelAndView("redirect:/projectController/projectList");
    }
}
