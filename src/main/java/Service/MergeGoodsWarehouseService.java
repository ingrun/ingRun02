package Service;

import Po.Record;

import java.util.List;

public interface MergeGoodsWarehouseService {
    public List<Record> findAllMerge(int id);
    public Record findRecordById(int id);
    public Record findRecordByGoodsIdAndWarehouseId(int goods_id,int warehouse_id);
    public int findSum(int id);
    public int updRecord(Record record);
    public boolean delRecord(int id);
    public boolean addRecord(Record record);
}
