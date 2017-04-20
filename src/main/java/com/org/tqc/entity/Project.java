package com.org.tqc.entity;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by 唐全成 on 2016/11/12.
 * <p>
 * purpose:员工
 */
public class Project{

    private int id;
    //项目名
    private String projectName;
    //项目描述
    private String description;
    //状态
    private int status;
    //管理员
    private int managerId;
    //创建时间
    private Date createTime;
    //最近修改事件
    private Date updateTime;
    //完成度
    private float done;
    //客户
    private int customerId;
    //版本
    private String version;
    //消息数
    private int msgNum;
    //预算
    private double budget;

    private Customer customer;

    private Set<User> crew = new HashSet<>(20);

    private int[] crews;

    private User manager;

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public float getDone() {
        return done;
    }

    public void setDone(float done) {
        this.done = done;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Set<User> getCrew() {
        return crew;
    }

    public void setCrew(Set<User> crew) {
        this.crew = crew;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public int getMsgNum() {
        return msgNum;
    }

    public void setMsgNum(int msgNum) {
        this.msgNum = msgNum;
    }

    public int[] getCrews() {
        return crews;
    }

    public void setCrews(int[] crews) {
        this.crews = crews;
    }

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", projectName='" + projectName + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", managerId=" + managerId +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", done=" + done +
                ", customerId=" + customerId +
                ", version='" + version + '\'' +
                ", msgNum=" + msgNum +
                ", budget=" + budget +
                ", customer=" + customer +
                ", crew=" + crew +
                ", crews=" + Arrays.toString(crews) +
                ", manager=" + manager +
                '}';
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }
}
