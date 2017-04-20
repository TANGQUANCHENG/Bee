package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by 唐全成 on 2016/11/9.
 * <p>
 * purpose:用户好友关系表
 */
public class FriendShip {
    //主键
    private int id;
    //主动方用户ID
    private int hostId;
    //好友方用户ID
    private int friendId;
    //此好友所处组
    private int friendGroupId;
    //排序
    private int sort;
    //好友关系创建时间
    private Date bindTime;
    //备注姓名
    private String remarkName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHostId() {
        return hostId;
    }

    public void setHostId(int hostId) {
        this.hostId = hostId;
    }

    public int getFriendId() {
        return friendId;
    }

    public void setFriendId(int friendId) {
        this.friendId = friendId;
    }

    public int getFriendGroupId() {
        return friendGroupId;
    }

    public void setFriendGroupId(int friendGroupId) {
        this.friendGroupId = friendGroupId;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public Date getBindTime() {
        return bindTime;
    }

    public void setBindTime(Date bindTime) {
        this.bindTime = bindTime;
    }

    public String getRemarkName() {
        return remarkName;
    }

    public void setRemarkName(String remarkName) {
        this.remarkName = remarkName;
    }

    @Override
    public String toString() {
        return "FriendShip{" +
                "id=" + id +
                ", hostId=" + hostId +
                ", friendId=" + friendId +
                ", friendGroupId=" + friendGroupId +
                ", sort=" + sort +
                ", bindTime=" + bindTime +
                ", remarkName='" + remarkName + '\'' +
                '}';
    }
}
