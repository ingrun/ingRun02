package Service;

import Po.Warehouse;
import Po.WarehouseLog;

import java.util.List;

public interface WarehouseService {
    public Warehouse findWarehouseById(int id);
    public List<Warehouse> findAllWarehouse();
    public int addWarehouse(Warehouse warehouse);
    public int delWarehouseById(int id);
    public int updWarehouse(Warehouse warehouse);
    public int findSum();
}
