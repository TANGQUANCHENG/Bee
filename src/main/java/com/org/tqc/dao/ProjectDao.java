package com.org.tqc.dao;

import com.org.tqc.entity.Project;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ProjectDao {

     Project selectProjectById(Map<String, Object> map);

     List<Project> selectAllProject();

     int addProject(Map<String, Object> map);

     void deleteProject(Map<String, Object> map);

     int updateBasicInfo(Map<String, Object> map);

     int updateDescription(Map<String, Object> map);
}
