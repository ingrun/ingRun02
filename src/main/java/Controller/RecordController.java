package Controller;


/*
* 记录控制器
* 添加删除修改记录
* 上车 下货等
*
*
* */

import Po.*;
import Service.GoodsService;
import Service.MergeGoodsWarehouseService;
import Service.WarehouseLogService;
import Service.WarehouseService;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



@Controller
public class RecordController {
    @Autowired
    private MergeGoodsWarehouseService mergeGoodsWarehouseService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private WarehouseService warehouseService;
    @Autowired
    private WarehouseLogService warehouseLogService;


    @RequestMapping(value = "findWareId" , produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAllRecordByWarehouseId(int id,HttpServletRequest request ){
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int sum = mergeGoodsWarehouseService.findSum(id);  //查总数

        //分页
        PageHelper.startPage(pageNum,pageSize);
        List<Record> records = mergeGoodsWarehouseService.findAllMerge(id);
        JSONArray jsonArray = new JSONArray();
        for(Record record:records){
            Goods goods = goodsService.findGoodsById(record.getGoods_id());
            Warehouse warehouse = warehouseService.findWarehouseById(record.getWarehouse_id());
            GoodsAndWarehouse goodsAndWarehouse = new GoodsAndWarehouse();
            goodsAndWarehouse.setId(record.getId());
            goodsAndWarehouse.setGoodsId(goods.getId());
            goodsAndWarehouse.setGoodsName(goods.getName());
            goodsAndWarehouse.setGoodsType(goods.getType());
            goodsAndWarehouse.setSum(record.getSum());
            goodsAndWarehouse.setWarehouseId(warehouse.getId());
            goodsAndWarehouse.setWarehouseName(warehouse.getName());
            jsonArray.add(goodsAndWarehouse);
        }

        return "{\"total\":"+sum+",\"rows\":"+jsonArray.toString()+"}";
    }

    @RequestMapping(value = "record/del" )
    @ResponseBody
    public String delRecordById(int id){
        //System.out.println("1");
        if(mergeGoodsWarehouseService.delRecord(id)){
            return "ok";
        }
        return "error";
    }

    @RequestMapping(value = "record/add" )
    @ResponseBody
    public String addRecord(int goods_id,int warehouse_id,int sum,int factory_id){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date1 = df.format(new Date());// new Date()为获取当前系统时间
        //
        Record record = new Record();
        record.setGoods_id(goods_id);
        record.setWarehouse_id(warehouse_id);
        record.setSum(sum);
        //
        WarehouseLog warehouseLog = new WarehouseLog();
        warehouseLog.setGoods_id(goods_id);
        warehouseLog.setWarehouse_id(warehouse_id);
        warehouseLog.setHandlers_id(1); //目前是仓库管理员
        warehouseLog.setOut_put("入库");  //添加都是PUT操作
        warehouseLog.setFactory_id(factory_id);
        warehouseLog.setSum(sum+"");
        warehouseLog.setDate(date1);
        if(mergeGoodsWarehouseService.addRecord(record)){
            Record record1 = mergeGoodsWarehouseService.findRecordByGoodsIdAndWarehouseId(record.getGoods_id(),record.getWarehouse_id());
            warehouseLog.setCurrent_inventory(record1.getSum()+"");
            if(warehouseLogService.addWarehouseLog(warehouseLog))
                return "ok";
        }
        return "error";
    }


    @RequestMapping(value = "record/out" )
    @ResponseBody
    public String outGoods(int client_id,int warehouse_id,int goods_id,int handlers_id,int sum){
        Record record = mergeGoodsWarehouseService.findRecordByGoodsIdAndWarehouseId(goods_id,warehouse_id);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date1 = df.format(new Date());// new Date()为获取当前系统时间
        if(record.getSum()> sum){
            record.setSum(record.getSum()-sum);
            mergeGoodsWarehouseService.updRecord(record);
            WarehouseLog warehouseLog = new WarehouseLog();
            warehouseLog.setSum(sum+"");
            warehouseLog.setClient_id(client_id);
            warehouseLog.setGoods_id(goods_id);
            warehouseLog.setWarehouse_id(warehouse_id);
            warehouseLog.setFactory_id(-1);
            warehouseLog.setHandlers_id(handlers_id);
            warehouseLog.setOut_put("出库");
            warehouseLog.setDate(date1);
            warehouseLog.setCurrent_inventory(record.getSum()+"");
            warehouseLogService.addWarehouseLog(warehouseLog);
            return "ok";
        }
        return "error";
    }
}
