package TestMapper;

import Mapper.MergeGoodsWarehouse;
import Po.Record;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestMerge {
    @Autowired
    private MergeGoodsWarehouse mergeGoodsWarehouse;
//    @Test
//    public void testadd(){
//        Record record = new Record();
//        record.setGoods_id(3);
//        record.setWarehouse_id(2);
//        record.setSum(600);
//        int i = mergeGoodsWarehouse.addRecord(record);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testupd(){
//        Record record = new Record();
//        record.setId(3);
//        record.setGoods_id(3);
//        record.setWarehouse_id(2);
//        record.setSum(400);
//        int i = mergeGoodsWarehouse.updRecord(record);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testfind(){
//        Record record = mergeGoodsWarehouse.findRecordById(3);
//        System.out.println(record);
//    }
//
//    @Test
//    public void testfindAll(){
//        List<Record> record = mergeGoodsWarehouse.findAllRecordByWarehouse(1);
//        for (Record record1:record){
//            System.out.println(record1);
//        }
//    }
}
