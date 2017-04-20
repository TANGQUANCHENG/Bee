package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by 唐全成 on 2016/11/17.
 * <p>
 * purpose:
 */
public class ProjectFile {
    private int id;
    //名称
    private String fileName;
    //指向服务器地址
    private String url;
    //所属项目ID
    private int projectId;
    //上传时间
    private Date uploadTime;
    //上传人
    private int uploadManager;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {

        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ProjectFile{" +
                "id=" + id +
                ", fileName='" + fileName + '\'' +
                ", url='" + url + '\'' +
                ", projectId=" + projectId +
                ", uploadTime=" + uploadTime +
                ", uploadManager=" + uploadManager +
                '}';
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public int getUploadManager() {
        return uploadManager;
    }

    public void setUploadManager(int uploadManager) {
        this.uploadManager = uploadManager;
    }

}
