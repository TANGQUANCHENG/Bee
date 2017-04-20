package com.org.tqc.service.impl;

import com.org.tqc.dao.CustomerDao;
import com.org.tqc.entity.Customer;
import com.org.tqc.service.CustomerService;
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
public class CustomerServiceImpl implements CustomerService {
    @Resource
    protected CustomerDao customerDao;

    @Override
    public Customer findCustomerById(Map<String, Object> map) {
        return customerDao.selectCustomerById(map);
    }

    @Override
    public List<Customer> findAllCustomer() {
        return customerDao.selectAllCustomer();
    }

    @Override
    public void addCustomer(Map<String, Object> map) {
        customerDao.addCustomer(map);
    }

    @Override
    public void deleteCustomer(Map<String, Object> map) {
        customerDao.deleteCustomer(map);
    }

    @Override
    public void updateCustomer(Map<String, Object> map) {
        customerDao.updateCustomer(map);
    }

    @Override
    public void updateCustomerStatus(Map<String, Object> map) {
        customerDao.updateCustomerStatus(map);
    }
}
