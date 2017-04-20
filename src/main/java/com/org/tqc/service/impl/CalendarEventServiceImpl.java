package com.org.tqc.service.impl;

import com.org.tqc.dao.CalendarEventDao;
import com.org.tqc.entity.CalendarEvent;
import com.org.tqc.service.CalendarEventService;
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
public class CalendarEventServiceImpl implements CalendarEventService {
    @Resource
    private CalendarEventDao calendarEventDao;

    @Override
    public CalendarEvent findCalendarEventById(Map<String, Object> map) {
        return calendarEventDao.selectCalendarEventById(map);
    }

    @Override
    public List<CalendarEvent> findAllCalendarEvent(Map<String, Object> map) {
        return calendarEventDao.selectAllCalendarEvent(map);
    }

    @Override
    public void addCalendarEvent(Map<String, Object> map) {
        calendarEventDao.addCalendarEvent(map);
    }

    @Override
    public void deleteCalendarEvent(Map<String, Object> map) {
        calendarEventDao.deleteCalendarEvent(map);
    }
}
