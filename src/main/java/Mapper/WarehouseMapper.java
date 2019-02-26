package Mapper;

import Po.Warehouse;

import java.util.List;

public interface WarehouseMapper {

    public Warehouse findWarehouseById(int id);
    public List<Warehouse> findAllWarehouse();
    public int addWarehouse(Warehouse warehouse);
    public int delWarehouseById(int id);
    public int updWarehouse(Warehouse warehouse);
    public int findSum();

}
