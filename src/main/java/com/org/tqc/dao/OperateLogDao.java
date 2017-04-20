package com.org.tqc.dao;

import com.org.tqc.entity.OperateLog;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface OperateLogDao {
     OperateLog selectOperateLog(Map<String, Object> map);

     List<OperateLog> selectAllOperateLogs();
}
