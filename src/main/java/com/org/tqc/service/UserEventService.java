package com.org.tqc.service;

import com.org.tqc.entity.UserEvent;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface UserEventService {

    UserEvent findUserEventById(Map<String, Object> map);

    UserEvent findUserEventByUserId(Map<String, Object> map);


    List<UserEvent> findAllUserEvent();

    void addUserEvent(Map<String, Object> map);

    void deleteUserEvent(Map<String, Object> map);

    void updateUserEvent(Map<String, Object> map);
}
