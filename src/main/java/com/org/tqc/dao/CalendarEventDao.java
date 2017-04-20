package com.org.tqc.dao;

import com.org.tqc.entity.CalendarEvent;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface CalendarEventDao {

     CalendarEvent selectCalendarEventById(Map<String, Object> map);

     List<CalendarEvent> selectAllCalendarEvent(Map<String, Object> map);

     void addCalendarEvent(Map<String, Object> map);

     void deleteCalendarEvent(Map<String, Object> map);

     void updateCalendarEvent(Map<String, Object> map);
}
