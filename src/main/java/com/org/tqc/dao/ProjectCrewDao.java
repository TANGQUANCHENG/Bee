package com.org.tqc.dao;

import com.org.tqc.entity.ProjectCrew;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ProjectCrewDao {
     ProjectCrew selectProjectCrew(Map<String, Object> map);

     List<ProjectCrew> selectAllProjectCrews();

     int addProjectCrew(Map<String, Object> map);
}
