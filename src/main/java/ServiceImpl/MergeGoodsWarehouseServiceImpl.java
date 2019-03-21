package ServiceImpl;

import Mapper.MergeGoodsWarehouse;
import Po.Record;
import Service.MergeGoodsWarehouseService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.table.TableRowSorter;
import java.util.List;

@Service
public class MergeGoodsWarehouseServiceImpl implements MergeGoodsWarehouseService {
    @Autowired
    private MergeGoodsWarehouse mergeGoodsWarehouse;
    @Override
    public List<Record> findAllMerge(int id) {
        return mergeGoodsWarehouse.findAllRecordByWarehouse(id);
    }

    @Override
    public Record findRecordById(int id) {
        return mergeGoodsWarehouse.findRecordById(id);
    }

    @Override
    public Record findRecordByGoodsIdAndWarehouseId(int goods_id, int warehouse_id) {
        return mergeGoodsWarehouse.findRecordByGoodsIdAndWarehouseId(goods_id,warehouse_id);
    }

    @Override
    public int findSum(int id) {
        return mergeGoodsWarehouse.findSum(id);
    }

    @Override
    public int updRecord(Record record) {
        return mergeGoodsWarehouse.updRecord(record);
    }

    @Override
    public boolean delRecord(int id) {
        return mergeGoodsWarehouse.delRecord(id) == 1;
    }

    @Override
    public boolean addRecord(Record record) {
        if(mergeGoodsWarehouse.addRecord(record)>0){
            return true;
        }
        return false;
    }

    @Override
    public List<Record> findGoodsSumById(int id) {
        return mergeGoodsWarehouse.findGoodsSumById(id);

    }

}
