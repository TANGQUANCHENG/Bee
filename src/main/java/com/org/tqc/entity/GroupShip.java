package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by dxkj on 2016/11/29.
 *
 * 用户加入群关系表群和用户的一对多的关系
 */
public class GroupShip {

    //主键
    private int id;
    //群ID
    private int groupId;
    //用户ID
    private int userId;
    //关联时间
    private Date bindTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getBindTime() {
        return bindTime;
    }

    public void setBindTime(Date bindTime) {
        this.bindTime = bindTime;
    }

    @Override
    public String toString() {
        return "GroupShip{" +
                "id=" + id +
                ", groupId=" + groupId +
                ", userId=" + userId +
                ", bindTime=" + bindTime +
                '}';
    }
}
