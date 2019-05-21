package TestService;

import Po.Goods;
import Po.GoodsAndWarehouse;
import Po.Record;
import Po.Warehouse;
import Service.GoodsService;
import Service.MergeGoodsWarehouseService;
import Service.WarehouseService;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSON;
import net.sf.json.JsonConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.sf.json.JSONArray;
import java.util.List;


@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestRecord {

    @Autowired
    private MergeGoodsWarehouseService mergeGoodsWarehouseService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private WarehouseService warehouseService;
//    @Test
//    public void testRecord(){
//        List<Record> records = mergeGoodsWarehouseService.findAllMerge(1);
//       JSONArray jsonArray = new JSONArray();
//        for(Record record:records){
//            Goods goods = goodsService.findGoodsById(record.getGoods_id());
//            Warehouse warehouse = warehouseService.findWarehouseById(record.getWarehouse_id());
//            GoodsAndWarehouse goodsAndWarehouse = new GoodsAndWarehouse();
//            goodsAndWarehouse.setGoodsId(goods.getId());
//            goodsAndWarehouse.setGoodsName(goods.getName());
//            goodsAndWarehouse.setGoodsType(goods.getType());
//            goodsAndWarehouse.setSum(record.getSum());
//            goodsAndWarehouse.setWarehouseId(warehouse.getId());
//            goodsAndWarehouse.setWarehouseName(warehouse.getName());
//            jsonArray.add(goodsAndWarehouse);
//        }
//
//        System.out.println(jsonArray);
//    }
//
//    @Test
//    public void testfenye(){
//        PageHelper.startPage(2,10);
//        List<Record> records =  mergeGoodsWarehouseService.findAllMerge(1);
//
//        for (Record record : records){
//            System.out.println(record.toString());
//        }
//
//    }
//
//    @Test
//    public void testSum(){
//        int i = mergeGoodsWarehouseService.findSum(1);
//        System.out.println(i);
//    }
//
    @Test
    public void testAdd(){
        Record record = new Record();
        record.setGoods_id(9);  //id 为 9 的货物
        record.setWarehouse_id(2);   // ID 为 2 的仓库
        record.setSum(200);  //数量为200
        mergeGoodsWarehouseService.addRecord(record);
    }
//
//    @Test
//    public void testFindGoods_idAndWarehouse_id(){
//        int goods_id = 2;
//        int warehouse_id = 2;
//        Record record = mergeGoodsWarehouseService.findRecordByGoodsIdAndWarehouseId(goods_id,warehouse_id);
//        System.out.println(record.toString());
//
//    }
}
