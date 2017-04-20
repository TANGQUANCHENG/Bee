package com.org.tqc.entity;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:话题
 */
public class Topic {
    /**
     * 主键
     */
    private int id;
    /**
     * 标题
     */
    private String title;
    /**
     * 描述
     */
    private String description;
    /**
     * 发布日期
     */
    private String postDate;
    /**
     * 发布人
     */
    private String authorId;
    /**
     * 状态：0正常1暂替-1关闭
     */
    private int status;
    /**
     * 徽记图片
     */
    private String emblem;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getEmblem() {
        return emblem;
    }

    public void setEmblem(String emblem) {
        this.emblem = emblem;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", postDate='" + postDate + '\'' +
                ", authorId='" + authorId + '\'' +
                ", status=" + status +
                ", emblem='" + emblem + '\'' +
                '}';
    }
}
