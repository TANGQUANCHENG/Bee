package com.org.tqc.entity;

import java.util.Date;

/**
 * Created by dxkj on 2016/11/25.
 */
public class OperateLog {

    private int id;

    private Date operateTime;

    private String operatorName;

    private String operate_type;

    private String operate_address;

    private String operate_commnet;

    private int typeChild;

    private int targetId;


    @Override
    public String toString() {
        return "{" +
                "id:" + id +
                ", operateTime:" + operateTime +
                ", operatorName:'" + operatorName + '\'' +
                ", operate_type:'" + operate_type + '\'' +
                ", operate_address:'" + operate_address + '\'' +
                ", operate_commnet:'" + operate_commnet + '\'' +
                ", typeChild:" + typeChild +
                ", targetId:" + targetId +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getOperate_type() {
        return operate_type;
    }

    public void setOperate_type(String operate_type) {
        this.operate_type = operate_type;
    }

    public String getOperate_address() {
        return operate_address;
    }

    public void setOperate_address(String operate_address) {
        this.operate_address = operate_address;
    }

    public String getOperate_commnet() {
        return operate_commnet;
    }

    public void setOperate_commnet(String operate_commnet) {
        this.operate_commnet = operate_commnet;
    }

    public int getTypeChild() {
        return typeChild;
    }

    public void setTypeChild(int typeChild) {
        this.typeChild = typeChild;
    }

    public int getTargetId() {
        return targetId;
    }

    public void setTargetId(int targetId) {
        this.targetId = targetId;
    }
}
