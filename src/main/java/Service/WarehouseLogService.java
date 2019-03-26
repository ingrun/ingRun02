package Service;

import Po.WarehouseLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WarehouseLogService {
    public List<WarehouseLog> findAll();
    public int delLog(int id);
    public boolean addWarehouseLog(WarehouseLog warehouseLog);
    public int findAllSumBy(int goods_id,
                            int warehouse_id,
                            int factory_id,
                            int client_id,
                            String out_put,
                            int handlers_id);

    //不用查询的约束可用 -1 表示空
    public List<WarehouseLog> findAllBy(int goods_id, int warehouse_id,
                                        int factory_id,int client_id,
                                        String out_put,int handlers_id);

}
