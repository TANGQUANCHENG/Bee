package com.org.tqc.dao;

import com.org.tqc.entity.Topic;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface TopicDao {
     Topic selectTopic(Map<String, Object> map);

     List<Topic> selectAllTopics();
}
