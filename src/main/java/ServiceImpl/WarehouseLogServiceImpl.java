package ServiceImpl;

import Mapper.WarehouseLogMapper;
import Mapper.WarehouseMapper;
import Po.WarehouseLog;
import Service.WarehouseLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.logging.LogManager;

@Service
public class WarehouseLogServiceImpl implements WarehouseLogService {
    @Autowired
    private WarehouseLogMapper warehouseLogMapper;

    @Override
    public List<WarehouseLog> findAll() {
        return warehouseLogMapper.findAllWarehouseLog();
    }

    @Override
    public int delLog(int id) {
        return warehouseLogMapper.delLog(id);
    }

    @Override
    public boolean addWarehouseLog(WarehouseLog warehouseLog) {
        return warehouseLogMapper.addWarehouseLog(warehouseLog)>0;
    }

    @Override
    public int findAllSumBy(int goods_id, int warehouse_id, int factory_id, int client_id, String out_put, int handlers_id) {
        return warehouseLogMapper.findAllSumBy(goods_id,warehouse_id,factory_id,client_id,out_put,handlers_id);
    }

    @Override
    public List<WarehouseLog> findAllBy(int goods_id, int warehouse_id, int factory_id, int client_id, String out_put, int handlers_id) {
        return warehouseLogMapper.findAllBy(goods_id,warehouse_id,factory_id,client_id,out_put,handlers_id);
    }


}
