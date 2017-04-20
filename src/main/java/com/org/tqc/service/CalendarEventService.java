package com.org.tqc.service;

import com.org.tqc.entity.CalendarEvent;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface CalendarEventService {

    CalendarEvent findCalendarEventById(Map<String, Object> map);

    List<CalendarEvent> findAllCalendarEvent(Map<String, Object> map);

    void addCalendarEvent(Map<String, Object> map);

    void deleteCalendarEvent(Map<String, Object> map);
}
