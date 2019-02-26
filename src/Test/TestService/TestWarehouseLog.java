package TestService;

import Po.WarehouseLog;
import Service.WarehouseLogService;
import Service.WarehouseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestWarehouseLog {
    @Autowired
    private WarehouseLogService warehouselogService;

//    @Test
//    public void testFindAll(){
//        List<WarehouseLog> warehouseLogs = warehouselogService.findAll();
//        for (WarehouseLog warehouseLog : warehouseLogs){
//            System.out.println(warehouseLog.toString());
//        }
//    }
//
//    @Test
//    public void testAdd(){
//        WarehouseLog warehouseLog = new WarehouseLog();
//        warehouseLog.setGoods_id(2);
//        warehouseLog.setWarehouse_id(2);
//        warehouseLog.setFactory_id(-1);
//        warehouseLog.setClient_id(2);
//        warehouseLog.setHandlers_id(1);
//        warehouseLog.setSum("200");
//        warehouseLog.setOut_put("入库");
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        String date1 = df.format(new Date());// new Date()为获取当前系统时间
//        warehouseLog.setDate(date1);
//        boolean i =  warehouselogService.addWarehouseLog(warehouseLog);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testFindAllBy(){
//        List<WarehouseLog> warehouseLogs =
//                warehouselogService.findAllBy(-1,-1,
//                        -1,-1,"%%库",-1);
//
//        for (WarehouseLog warehouseLog : warehouseLogs){
//            System.out.println(warehouseLog.toString());
//        }
//    }
//
//    @Test
//    public void testFindAllSumBy(){
//       int i= warehouselogService.findAllSumBy(-1,-1,
//                        -1,-1,"出库",-1);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testDel(){
//        int i = warehouselogService.delLog(29);
//        System.out.println(i);
//    }
}
