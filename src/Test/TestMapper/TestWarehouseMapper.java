package TestMapper;

import Mapper.WarehouseLogMapper;
import Mapper.WarehouseMapper;
import Po.Warehouse;
import Po.WarehouseLog;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestWarehouseMapper {

    @Autowired
    private WarehouseMapper warehouseMapper;

    @Autowired
    private WarehouseLogMapper warehouseLogMapper;

    @Test
    public void test(){
        WarehouseLog warehouseLog = new WarehouseLog();
        warehouseLog.setSum("200");
        warehouseLog.setClient_id(1);
        warehouseLog.setGoods_id(1);
        warehouseLog.setWarehouse_id(1);
        warehouseLog.setFactory_id(-1);
        warehouseLog.setHandlers_id(1);
        warehouseLog.setOut_put("出库");
        warehouseLog.setDate("2019-04-11 11:10:50");
        warehouseLog.setCurrent_inventory("1000");
        int i = warehouseLogMapper.addWarehouseLog(warehouseLog);
        System.out.println(i);

    }



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
