package com.org.tqc.service.impl;

import com.org.tqc.dao.ArticleDao;
import com.org.tqc.entity.Article;
import com.org.tqc.service.ArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleDao articleDao;

    @Override
    public List<Article> findArticleByTopic(Map<String, Object> map) {
        return articleDao.selectArticleByTopic(map);
    }

    @Override
    public Article findArticleById(Map<String, Object> map) {
        return articleDao.selectArticleById(map);
    }

    @Override
    public List<Article> findAllArticle() {
        return articleDao.selectAllArticle();
    }

    @Override
    public void addArticle(Map<String, Object> map) {
        articleDao.addArticle(map);
    }
}
