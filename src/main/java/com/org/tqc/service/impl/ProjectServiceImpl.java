package com.org.tqc.service.impl;

import com.org.tqc.dao.ProjectCrewDao;
import com.org.tqc.dao.ProjectDao;
import com.org.tqc.entity.Project;
import com.org.tqc.entity.ProjectCrew;
import com.org.tqc.service.ProjectService;
import com.org.tqc.util.CommenUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Service
public class ProjectServiceImpl implements ProjectService {
    @Resource
    private ProjectDao projectDao;
    @Resource
    private ProjectCrewDao projectCrewDao;

    @Override
    public Project findProjectById(Map<String, Object> map) {
        return projectDao.selectProjectById(map);
    }

    @Override
    public List<Project> findAllProject() {
        return projectDao.selectAllProject();
    }

    @Transactional
    @Override
    public int addProject(Map<String, Object> map) {
        Map<String, Object> paramMap;
        projectDao.addProject(map);
        int projectId = (int) map.get("id");
        int[] arr = (int[]) map.get("crews");
        if (arr != null && arr.length > 0) {
            for (int i = 0; i < arr.length; i++) {
                ProjectCrew pc = new ProjectCrew(projectId, arr[i], new Date());
                paramMap = CommenUtil.beanToMap(pc);
                projectCrewDao.addProjectCrew(paramMap);
            }
        }
        return 1;
    }

    @Override
    public void deleteProject(Map<String, Object> map) {
        projectDao.deleteProject(map);
    }

    @Override
    public int updateDescription(Map<String, Object> map) {
        return projectDao.updateDescription(map);
    }

    @Override
    public int updateProjectInfo(Map<String, Object> map) {
        return projectDao.updateBasicInfo(map);
    }
}
