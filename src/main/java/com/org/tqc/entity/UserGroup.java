package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by dxkj on 2016/11/29.
 * <p>
 * 群
 */
public class UserGroup {
    //主键
    private int id;
    //群名称
    private String UserGroupName;
    //描述
    private String description;
    //最大人数
    private int maxNum;
    //创建时间
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserGroupName() {

        return UserGroupName;
    }

    public void setUserGroupName(String userGroupName) {
        UserGroupName = userGroupName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMaxNum() {
        return maxNum;
    }

    public void setMaxNum(int maxNum) {
        this.maxNum = maxNum;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "UserGroup{" +
                "id=" + id +
                ", UserGroupName='" + UserGroupName + '\'' +
                ", description='" + description + '\'' +
                ", maxNum=" + maxNum +
                ", createTime=" + createTime +
                '}';
    }
}
