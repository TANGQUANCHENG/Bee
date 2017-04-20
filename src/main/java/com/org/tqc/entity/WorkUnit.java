package com.org.tqc.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by dxkj on 2016/12/1.
 */
public class WorkUnit {

    //主键
    private int id;
    //单元名称
    private String unitName;
    //描述
    private String description;
    //创建时间
    private Date createTime;
    //状态
    private int state;
    //组员
    private List<User> crew;
    //项目
    private List<Project> projects;

    @Override
    public String toString() {
        return "WorkUnit{" +
                "id=" + id +
                ", unitName='" + unitName + '\'' +
                ", description='" + description + '\'' +
                ", createTime=" + createTime +
                ", state=" + state +
                ", crew=" + crew +
                ", projects=" + projects +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public List<User> getCrew() {
        return crew;
    }

    public void setCrew(List<User> crew) {
        this.crew = crew;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }
}
