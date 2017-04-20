import com.org.tqc.dao.CustomerDao;
import com.org.tqc.entity.Customer;
import com.org.tqc.service.CustomerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dxkj on 2016/12/19.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class firstTest {

    @Autowired
    protected CustomerService customerService;


    @Autowired(required=false)
    private CustomerDao customerDao;
    @Test
    public void testCustomerDao() {


        List<Customer> list = customerService.findAllCustomer();

        List<Customer> list2 = customerService.findAllCustomer();

        System.out.println(list);
        System.out.println(list2);
    }
}
