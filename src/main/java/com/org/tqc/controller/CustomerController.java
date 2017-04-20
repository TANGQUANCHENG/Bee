package com.org.tqc.controller;

import com.org.tqc.entity.Customer;
import com.org.tqc.service.CustomerService;
import com.org.tqc.util.CommenUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 唐全成 on 2016/10/27.
 * <p>
 * purpose:
 */
@Controller
@RequestMapping("/customerController")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    @RequestMapping(value="/customerList")
    @ResponseBody
    public ModelAndView myProfile(HttpServletRequest request){
        ModelAndView md= new ModelAndView("/customer");
        md.addObject("allCustomers",customerService.findAllCustomer());
        return md;
    }

    @RequestMapping(value="/getAllCustomers")
    @ResponseBody
    public List<Customer> allCustomer(){
        return customerService.findAllCustomer();
    }


    @RequestMapping(value="/addCustomer")
    @ResponseBody
    public ModelAndView addCustomer(Customer customer){
        Map<String, Object> paramMap;

        paramMap = CommenUtil.beanToMap(customer);
        customerService.addCustomer(paramMap);

        System.out.println(customer);
        return new ModelAndView("redirect:/customerController/customerList");
    }

    @RequestMapping(value="/updateCustomer")
    @ResponseBody
    public ModelAndView updateCustomer(Customer customer){
        Map<String, Object> paramMap;

        paramMap = CommenUtil.beanToMap(customer);
        customerService.updateCustomer(paramMap);
        System.out.println(customer);
        return new ModelAndView("redirect:/customerController/customerList");
    }


    @RequestMapping(value="/findCustomer/{id}")
    @ResponseBody
    public Customer findCustomer(@PathVariable Long id){
        Map<String, Object> paramMap=new HashMap<String, Object>(0);
        paramMap.put("id",id);
        return customerService.findCustomerById(paramMap);
    }
}
