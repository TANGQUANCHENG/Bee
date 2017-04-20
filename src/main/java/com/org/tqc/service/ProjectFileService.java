package com.org.tqc.service;

import com.org.tqc.entity.ProjectFile;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ProjectFileService {

    ProjectFile findProjectFileById(Map<String, Object> map);

    List<ProjectFile> findAllProjectFile();

    void addProjectFile(Map<String, Object> map);

    void deleteProjectFile(Map<String, Object> map);

}
