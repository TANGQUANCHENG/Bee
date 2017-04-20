package com.org.tqc.entity;

/**
 * Created by 唐全成 on 2016/11/21.
 * <p>
 * purpose:
 */
public class uploadFile {

    private String fullName;

    private String name;

    private int type;

    private String date;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
