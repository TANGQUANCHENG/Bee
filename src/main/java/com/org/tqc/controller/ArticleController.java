package com.org.tqc.controller;

import com.org.tqc.entity.Article;
import com.org.tqc.service.ArticleService;
import com.org.tqc.service.TopicService;
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
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/articleController")
public class ArticleController {
    @Resource
    private ArticleService articleService;

    @RequestMapping(value="/articleList")
    @ResponseBody
    public ModelAndView articleList(){
        ModelAndView md= new ModelAndView("/blogList");
        md.addObject("allArticle",articleService.findAllArticle());
        return md;
    }

    @RequestMapping(value="/article/{id}")
    @ResponseBody
    public ModelAndView articleContent(@PathVariable Long id){
        ModelAndView md= new ModelAndView("/article");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("article_id", id);
        Article article= articleService.findArticleById(paramMap);
        md.addObject("article",article);
        return md;
    }

    @RequestMapping(value="/toEditArticle")
    @ResponseBody
    public ModelAndView toEditArticle(){
        ModelAndView md= new ModelAndView("/editArticle");
        return md;
    }

    @RequestMapping(value="/addArticle")
    @ResponseBody
    public MessageBean addArticle(Article article){

        System.out.println(article);
        article.setAuthorId(0);
        article.setLike(0);
        article.setTopicId(0);
        article.setStatus(0);

        Map<String, Object> paramMap;
        MessageBean m;
        try {
            paramMap = CommenUtil.beanToMap(article);
            articleService.addArticle(paramMap);
            m=MessageBean.success();
        } catch (Exception e) {
            m=MessageBean.fail();
            e.printStackTrace();
        }


        return m;
    }
}
