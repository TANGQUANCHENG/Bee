package com.org.tqc.dwr;

import com.org.tqc.service.CustomerService;
import com.org.tqc.util.CommenUtil;
import org.apache.commons.lang.StringUtils;
import org.directwebremoting.Browser;
import org.directwebremoting.ui.dwr.Util;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/26.
 * <p>
 * purpose:
 */
public class CustomerRS {

    @Resource
    private CustomerService customerService;

    public void updateCustomerStatus(final int customerId, final int status){
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("id",customerId);
        paramMap.put("status",status);
        customerService.updateCustomerStatus(paramMap);
        Browser.withAllSessions(new Runnable() {
            public void run() {
                Util.setValue("customerStatus_"+customerId, status==1?"已验证":"已删除");
                Util.removeClassName("customerStatus_"+customerId,"label-primary");
                Util.removeClassName("customerStatus_"+customerId,"label-danger");
                Util.removeClassName("customerStatus_"+customerId,"label-warning");
                Util.setClassName("customerStatus_"+customerId,status==1?"label label-primary":"label label-danger");
            }
        });
    }
}
