package com.org.tqc.service;

import com.org.tqc.entity.Project;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ProjectService {

    Project findProjectById(Map<String, Object> map);

    List<Project> findAllProject();

    int addProject(Map<String, Object> map);

    void deleteProject(Map<String, Object> map);

    int updateDescription(Map<String, Object> map);

    int updateProjectInfo(Map<String, Object> map);
}
