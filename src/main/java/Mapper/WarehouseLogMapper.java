package Mapper;

import Po.WarehouseLog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WarehouseLogMapper {
    public int addWarehouseLog(WarehouseLog warehouseLog);
    public List<WarehouseLog> findAllWarehouseLog();
    public int delLog(int id);
    public int findAllSumBy(@Param("goods_id")int goods_id,
                            @Param("warehouse_id")int warehouse_id,
                            @Param("factory_id")int factory_id,
                            @Param("client_id") int client_id,
                            @Param("out_put") String out_put,
                            @Param("handlers_id") int handlers_id);
    public List<WarehouseLog> findAllBy(@Param("goods_id")int goods_id,
                                        @Param("warehouse_id")int warehouse_id,
                                        @Param("factory_id")int factory_id,
                                        @Param("client_id") int client_id,
                                        @Param("out_put") String out_put,
                                        @Param("handlers_id") int handlers_id);

}
