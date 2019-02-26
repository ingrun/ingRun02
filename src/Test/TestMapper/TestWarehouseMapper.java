package TestMapper;

import Mapper.WarehouseMapper;
import Po.Warehouse;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestWarehouseMapper {

    @Autowired
    private WarehouseMapper warehouseMapper;

//    @Test
//    public void testAddWarehouse(){
//        Warehouse warehouse = new Warehouse();
//        warehouse.setName("仓库");
//        warehouse.setAddress("槐林");
//        int i = warehouseMapper.addWarehouse(warehouse);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testfind(){
//        Warehouse warehouse = warehouseMapper.findWarehouseById(1);
//        System.out.println(warehouse.toString());
//    }
//
//    @Test
//    public void testdel(){
//        int i = warehouseMapper.delWarehouseById(1);
//        System.out.println(i);
//    }
}
