package com.org.tqc.service;

import com.org.tqc.entity.Article;
import com.org.tqc.entity.User;
import com.org.tqc.util.MessageBean;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ArticleService {

    List<Article> findArticleByTopic(Map<String, Object> map);

    Article findArticleById(Map<String, Object> map);

    List<Article> findAllArticle();

    void addArticle(Map<String, Object> map);
}
