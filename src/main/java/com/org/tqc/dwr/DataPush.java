package com.org.tqc.dwr;

import com.org.tqc.entity.OperateLog;
import com.org.tqc.service.OperateLogService;
import com.org.tqc.util.CommenUtil;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/26.
 * <p>
 * purpose:
 */
public class DataPush {

    @Resource
    private OperateLogService operateLogService;

    public List<String> getLogData() {

        List<OperateLog> list = operateLogService.findAllOperateLogs();
        List<String> strList = new ArrayList<>(20);

        if (list != null && list.size() > 0) {
            for (OperateLog o : list) {
                strList.add(o.toString());
            }

        }
        return strList;
    }
}
