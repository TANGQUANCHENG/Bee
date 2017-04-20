package com.org.tqc.service;

import com.org.tqc.entity.Customer;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
public interface CustomerService {

    Customer findCustomerById(Map<String, Object> map);

    List<Customer> findAllCustomer();

    void addCustomer(Map<String, Object> map);

    void deleteCustomer(Map<String, Object> map);

    void updateCustomer(Map<String, Object> map);

    void updateCustomerStatus(Map<String, Object> map);
}
