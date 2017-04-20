package com.org.tqc.util;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;

/**
 * 界面消息
 *
 * @author tqc
 */
public class MessageBean {

    /**
     * 操作结果
     */
    private Boolean success;
    /**
     * 标题
     */
    private String title;
    /**
     * 提示消息
     */
    private String message;
    /**
     * 对象实体
     */
    private Object bean;

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Object getBean() {
        return bean;
    }

    public void setBean(Object bean) {
        this.bean = bean;
    }

    @Override
    public String toString() {
        return "MessageBean [success=" + success + ", message=" + message + "]";
    }

    public MessageBean() {
        super();
        this.success = success;
        this.message = message;
    }

    public MessageBean(Boolean success, String message, Object bean) {
        super();
        this.success = success;
        this.message = message;
        this.bean = bean;
    }

    public MessageBean(String title, String message) {
        super();
        this.title = title;
        this.message = message;
    }

    public MessageBean(Exception ex) {
        super();
        this.success = false;
        this.message = ex.getMessage();
    }

    public static MessageBean success() {
        MessageBean messageBean = new MessageBean();
        messageBean.setSuccess(true);
        messageBean.setMessage("操作成功");
        return messageBean;
    }

    public static MessageBean fail(String msg) {
        MessageBean messageBean = new MessageBean();
        messageBean.setSuccess(false);
        messageBean.setMessage(msg);
        messageBean.setTitle("ERROR");
        return messageBean;
    }

    public static MessageBean fail() {
        return fail("操作失败");
    }


}
