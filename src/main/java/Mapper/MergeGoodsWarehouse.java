package Mapper;

import Po.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MergeGoodsWarehouse {

    public int addRecord(Record record);
    public Record findRecordById(int id);
    public Record findRecordByGoodsIdAndWarehouseId(@Param("goods_id")int goods_id, @Param("warehouse_id")int warehouse_id);
    public List<Record> findAllRecordByWarehouse(int id);
    public int updRecord(Record record);
    public int delRecord(int id);
    //查找某个仓库的总记录数
    public int findSum(int id);

}
