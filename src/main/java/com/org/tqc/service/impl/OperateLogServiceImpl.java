package com.org.tqc.service.impl;

import com.org.tqc.dao.OperateLogDao;
import com.org.tqc.entity.OperateLog;
import com.org.tqc.service.OperateLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Service
public class OperateLogServiceImpl implements OperateLogService {
    @Resource
    private OperateLogDao OperateLogDao;
    @Override
    public List<OperateLog> findAllOperateLogs() {
        return OperateLogDao.selectAllOperateLogs();
    }
}
