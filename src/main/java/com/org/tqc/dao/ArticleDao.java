package com.org.tqc.dao;

import com.org.tqc.entity.Article;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ArticleDao {

     Article selectArticleById(Map<String, Object> map);

     List<Article> selectArticleByTopic(Map<String, Object> map);

     List<Article> selectAllArticle();

     void addArticle(Map<String, Object> map);
}
