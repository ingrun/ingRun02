package Controller;

import Po.*;
import Service.*;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class LogController {
    @Autowired
    private WarehouseLogService warehouseLogService;
    @Autowired
    private WarehouseService warehouseService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private HandlersService handlersService;
    @Autowired
    private OtherService otherService;
    @Autowired
    ClientService clientService;

    @RequestMapping(value = "Log/findWarehouseLog", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findWarehouselog(int pageNum,int pageSize,String out_put,int warehouse_id){
        int sum = warehouseLogService.findAllSumBy(-1,warehouse_id,-1,
                -1,out_put,-1);//总记录数
        String orderBy = "date desc";   //倒序排列
        PageHelper.startPage(pageNum,pageSize,orderBy);   //分页
        List<WarehouseLog> warehouseLogs = warehouseLogService.findAllBy(-1,warehouse_id,
                -1,-1,out_put,-1);
        JSONArray jsonArray = new JSONArray();
        for(WarehouseLog warehouseLog : warehouseLogs){
            Goods goods = goodsService.findGoodsById(warehouseLog.getGoods_id());
            Warehouse warehouse = warehouseService.findWarehouseById(warehouseLog.getWarehouse_id());
            Handlers handlers = handlersService.findHandlersById(warehouseLog.getHandlers_id());
            FactorySite factorySite = otherService.findFactorySiteById(warehouseLog.getFactory_id());
            Client client = clientService.findClientById(warehouseLog.getClient_id());
            WarehouseLogInfo warehouseLogInfo = new WarehouseLogInfo();
            warehouseLogInfo.setId(warehouseLog.getId());
            warehouseLogInfo.setGoods_name(goods.getName());
            warehouseLogInfo.setGoods_type(goods.getType());
            warehouseLogInfo.setWarehouse_name(warehouse.getName());
            warehouseLogInfo.setHandlers_name(handlers.getName());
            if(factorySite != null){
                warehouseLogInfo.setFactory_name(factorySite.getName());
            }
            if(client != null){
                warehouseLogInfo.setClient_name(client.getName());
            }
            warehouseLogInfo.setDate(warehouseLog.getDate());
            warehouseLogInfo.setOut_put(warehouseLog.getOut_put());
            warehouseLogInfo.setSum(warehouseLog.getSum());
            warehouseLogInfo.setCurrent_inventory(warehouseLog.getCurrent_inventory());
            jsonArray.add(warehouseLogInfo);
        }

        return "{\"total\":"+sum+",\"rows\":"+jsonArray.toString()+"}";
    }


    @RequestMapping(value = "Log/del", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delLog(int id){
        if( warehouseLogService.delLog(id)>0){
            return "ok";
        }
        return "error";
    }
}
