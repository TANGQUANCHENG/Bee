package com.org.tqc.service;

import com.org.tqc.entity.Topic;
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
public interface TopicService {

     List<Topic> findAllTopics();
}
