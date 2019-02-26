package TestService;
import Po.FactorySite;
import Service.OtherService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestOther {

    @Autowired
    private OtherService otherService;
//
//    @Test
//    public void testFindAllFactorySite() {
//        List<FactorySite> factorySites = otherService.findAllFactorySite();
//        for (FactorySite factorySite : factorySites){
//            System.out.println(factorySite);
//        }
//    }

}
