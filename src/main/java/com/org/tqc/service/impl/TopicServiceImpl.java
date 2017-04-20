package com.org.tqc.service.impl;

import com.org.tqc.dao.TopicDao;
import com.org.tqc.entity.Topic;
import com.org.tqc.service.TopicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Service
public class TopicServiceImpl implements TopicService {
    @Resource
    private TopicDao topicDao;
    @Override
    public List<Topic> findAllTopics() {
        return topicDao.selectAllTopics();
    }
}
