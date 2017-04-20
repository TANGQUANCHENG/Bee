package com.org.tqc.service;

import com.org.tqc.entity.OperateLog;

import java.util.List;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface OperateLogService {

     List<OperateLog> findAllOperateLogs();
}
