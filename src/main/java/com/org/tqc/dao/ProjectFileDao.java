package com.org.tqc.dao;

import com.org.tqc.entity.ProjectFile;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ProjectFileDao {

     ProjectFile selectProjectFileById(Map<String, Object> map);

     List<ProjectFile> selectAllProjectFile();

     void addProjectFile(Map<String, Object> map);

     void deleteProjectFile(Map<String, Object> map);

     void updateProjectFile(Map<String, Object> map);
}
