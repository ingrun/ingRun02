package ServiceImpl;

import Mapper.WarehouseMapper;
import Po.Warehouse;
import Po.WarehouseLog;
import Service.WarehouseService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WarehouseServiceImpl implements WarehouseService {
    @Autowired
    private WarehouseMapper warehouseMapper;
    @Override

    //仓库库存查询
    public Warehouse findWarehouseById(int id) {

        return warehouseMapper.findWarehouseById(id);
    }

    @Override
    public List<Warehouse> findAllWarehouse() {
        return warehouseMapper.findAllWarehouse();
    }

    @Override
    public int addWarehouse(Warehouse warehouse) {
        return warehouseMapper.addWarehouse(warehouse);
    }

    @Override
    public int delWarehouseById(int id) {
        return warehouseMapper.delWarehouseById(id);
    }

    @Override
    public int updWarehouse(Warehouse warehouse) {
        return warehouseMapper.updWarehouse(warehouse);
    }

    @Override
    public int findSum() {
        return warehouseMapper.findSum();
    }
}
