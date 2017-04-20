package com.org.tqc.service.impl;

import com.org.tqc.dao.UserEventDao;
import com.org.tqc.entity.UserEvent;
import com.org.tqc.service.UserEventService;
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
public class UserEventServiceImpl implements UserEventService {
    @Resource
    private UserEventDao UserEventDao;

    @Override
    public UserEvent findUserEventById(Map<String, Object> map) {
        return UserEventDao.selectUserEventById(map);
    }

    @Override
    public UserEvent findUserEventByUserId(Map<String, Object> map) {
        return UserEventDao.selectUserEventByUserId(map);
    }

    @Override
    public List<UserEvent> findAllUserEvent() {
        return UserEventDao.selectAllUserEvent();
    }

    @Override
    public void addUserEvent(Map<String, Object> map) {
        UserEventDao.addUserEvent(map);
    }

    @Override
    public void deleteUserEvent(Map<String, Object> map) {
        UserEventDao.deleteUserEvent(map);
    }

    @Override
    public void updateUserEvent(Map<String, Object> map) {
        UserEventDao.updateUserEvent(map);
    }
}
