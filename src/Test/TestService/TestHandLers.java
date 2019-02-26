package TestService;

import Po.Handlers;
import Service.HandlersService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestHandLers {
    @Autowired
    private HandlersService handlersService;

//    @Test
//    public void testFindAll(){
//        List<Handlers> handlers = handlersService.findAll();
//        for (Handlers handlers1 : handlers){
//            System.out.println(handlers1.getName());
//        }
//    }


}
