package com.org.tqc.entity;

import java.util.List;

/**
 * Created by 唐全成 on 2016/11/9.
 * <p>
 * purpose:用户好友列表组
 */
public class FriendGroup {
    //主键
    private int id;
    //名称
    private String FriendGroupName;
    //用户
    private int userId;
    //总数量
    private int sums;
    //所包含的好友集合
    private List<User> friendUsers;

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

    public int getSums() {
        return sums;
    }

    public String getFriendGroupName() {
        return FriendGroupName;
    }

    public void setFriendGroupName(String friendGroupName) {
        FriendGroupName = friendGroupName;
    }

    public void setSums(int sums) {
        this.sums = sums;
    }

    public List<User> getFriendUsers() {
        return friendUsers;
    }

    public void setFriendUsers(List<User> friendUsers) {
        this.friendUsers = friendUsers;
    }

    @Override
    public String toString() {
        return "FriendGroup{" +
                "id=" + id +
                ", FriendGroupName='" + FriendGroupName + '\'' +
                ", userId=" + userId +
                ", sums=" + sums +
                ", friendUsers=" + friendUsers +
                '}';
    }
}
