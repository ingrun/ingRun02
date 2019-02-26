package Controller;

import Po.Goods;
import Po.Warehouse;
import Service.WarehouseService;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class WarehouseController {
    @Autowired
    private WarehouseService warehouseService;

    @RequestMapping(value = "warehouse/findAll", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAll(){
        //PageHelper.startPage(1,5);
        List<Warehouse> warehouses = warehouseService.findAllWarehouse();
        JSONArray jsonArray = JSONArray.fromObject(warehouses);
        return jsonArray.toString();
    }

    @RequestMapping(value = "warehouse/findAllPage", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAllPage(int pageNum,int pageSize ){
        int sum = warehouseService.findSum();
        PageHelper.startPage(pageNum,pageSize);
        List<Warehouse> warehouses = warehouseService.findAllWarehouse();
        JSONArray jsonArray = JSONArray.fromObject(warehouses);
        return "{\"total\":"+sum+",\"rows\":"+jsonArray.toString()+"}";
    }

    @RequestMapping(value = "warehouse/addWarehouse", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String addWarehouse(String name,String  address ){
        Warehouse warehouse = new Warehouse();
        warehouse.setName(name);
        warehouse.setAddress(address);
        if (warehouseService.addWarehouse(warehouse)>0){
            return "ok";
        }
        return "error";
    }

    @RequestMapping(value = "warehouse/updWarehouse", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String updWarehouse(int id,String name,String  address ){
        Warehouse warehouse = new Warehouse();
        warehouse.setId(id);
        warehouse.setName(name);
        warehouse.setAddress(address);
        if (warehouseService.updWarehouse(warehouse)>0){
            return "ok";
        }
        return "error";
    }

    @RequestMapping(value = "warehouse/delWarehouse", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delWarehouse(int id){
        if (warehouseService.delWarehouseById(id)>0){
            return "ok";
        }
        return "error";
    }
}
