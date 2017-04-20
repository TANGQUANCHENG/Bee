package com.org.tqc.service.impl;

import com.org.tqc.dao.ProjectCrewDao;
import com.org.tqc.entity.ProjectCrew;
import com.org.tqc.service.ProjectCrewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Service
public class ProjectCrewServiceImpl implements ProjectCrewService {
    @Resource
    private ProjectCrewDao ProjectCrewDao;
    @Override
    public List<ProjectCrew> findAllProjectCrews() {
        return ProjectCrewDao.selectAllProjectCrews();
    }

    @Override
    public int addProjectCrew(Map<String, Object> map) {
        return ProjectCrewDao.addProjectCrew(map);
    }
}
