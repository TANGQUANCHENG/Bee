package com.org.tqc.entity;

/**
 * Created by 唐全成 on 2016/11/3.
 * <p>
 * purpose:
 */
public class CalendarEvent {
    private int id;

    private int userId;

    private String description;

    private String color;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "CalendarEvent{" +
                "id=" + id +
                ", userId=" + userId +
                ", description='" + description + '\'' +
                ", color='" + color + '\'' +
                '}';
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

}
