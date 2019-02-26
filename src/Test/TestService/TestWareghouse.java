package TestService;


import Po.Warehouse;
import Service.WarehouseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestWareghouse {
    @Autowired
    private WarehouseService warehouseService;

//    @Test
//    public void testFindAll(){
//        List<Warehouse> w = warehouseService.findAllWarehouse();
//        for(Warehouse warehouse:w){
//            System.out.println(warehouse.toString());
//        }
//    }

}
