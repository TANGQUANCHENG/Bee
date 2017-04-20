package com.org.tqc.dao;

import com.org.tqc.entity.Customer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/25.
 * <p>
 * purpose:
 */
@Repository
public interface CustomerDao {

     Customer selectCustomerById(Map<String, Object> map);

     List<Customer> selectAllCustomer();

     void addCustomer(Map<String, Object> map);

     void deleteCustomer(Map<String, Object> map);

     void updateCustomer(Map<String, Object> map);

     void updateCustomerStatus(Map<String, Object> map);
}
