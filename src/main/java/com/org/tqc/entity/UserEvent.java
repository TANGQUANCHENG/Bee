package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by 唐全成 on 2016/11/3.
 * <p>
 * purpose:
 */
public class UserEvent {
    //主键
    private int id;
    //用户主键
    private int userId;
    //绑定时间
    private String eventJSON;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEventJSON() {
        return eventJSON;
    }

    public void setEventJSON(String eventJSON) {
        this.eventJSON = eventJSON;
    }

    @Override
    public String toString() {
        return "UserEvent{" +
                "id=" + id +
                ", userId=" + userId +
                ", eventJSON='" + eventJSON + '\'' +
                '}';
    }
}
