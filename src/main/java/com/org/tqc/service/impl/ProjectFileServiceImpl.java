package com.org.tqc.service.impl;

import com.org.tqc.dao.ProjectFileDao;
import com.org.tqc.entity.ProjectFile;
import com.org.tqc.service.ProjectFileService;
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
public class ProjectFileServiceImpl implements ProjectFileService {
    @Resource
    protected ProjectFileDao ProjectFileDao;

    @Override
    public ProjectFile findProjectFileById(Map<String, Object> map) {
        return ProjectFileDao.selectProjectFileById(map);
    }

    @Override
    public List<ProjectFile> findAllProjectFile() {
        return ProjectFileDao.selectAllProjectFile();
    }

    @Override
    public void addProjectFile(Map<String, Object> map) {
        ProjectFileDao.addProjectFile(map);
    }

    @Override
    public void deleteProjectFile(Map<String, Object> map) {
        ProjectFileDao.deleteProjectFile(map);
    }
}
