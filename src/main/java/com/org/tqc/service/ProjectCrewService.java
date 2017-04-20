package com.org.tqc.service;

import com.org.tqc.entity.ProjectCrew;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface ProjectCrewService {

     List<ProjectCrew> findAllProjectCrews();

     int addProjectCrew(Map<String, Object> map);
}
