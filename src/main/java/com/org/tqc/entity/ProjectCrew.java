package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by dxkj on 2016/12/7.
 */
public class ProjectCrew {

    private int id;

    private int projectId;

    private int userId;

    private Date bindTime;

    @Override
    public String toString() {
        return "ProjectCrew{" +
                "id=" + id +
                ", projectId=" + projectId +
                ", userId=" + userId +
                ", bindTime=" + bindTime +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
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

    public ProjectCrew(int projectId, int userId, Date bindTime) {
        this.projectId = projectId;
        this.userId = userId;
        this.bindTime = bindTime;
    }
}
