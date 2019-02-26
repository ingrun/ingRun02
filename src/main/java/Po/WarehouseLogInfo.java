package Po;

public class WarehouseLogInfo {

    private int id;
    private String goods_name;
    private String goods_type;
    private String warehouse_name;
    private String handlers_name;
    private String factory_name;
    private String client_name;
    private String date;
    private String out_put;
    private String sum;
    private String current_inventory;

    public String getCurrent_inventory() {
        return current_inventory;
    }

    public void setCurrent_inventory(String current_inventory) {
        this.current_inventory = current_inventory;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_type() {
        return goods_type;
    }

    public String getClient_name() {
        return client_name;
    }

    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }

    public void setGoods_type(String goods_type) {
        this.goods_type = goods_type;
    }

    public String getWarehouse_name() {
        return warehouse_name;
    }

    public void setWarehouse_name(String warehouse_name) {
        this.warehouse_name = warehouse_name;
    }

    public String getHandlers_name() {
        return handlers_name;
    }

    public void setHandlers_name(String handlers_name) {
        this.handlers_name = handlers_name;
    }

    public String getFactory_name() {
        return factory_name;
    }

    public void setFactory_name(String factory_name) {
        this.factory_name = factory_name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getOut_put() {
        return out_put;
    }

    public void setOut_put(String out_put) {
        this.out_put = out_put;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }
}
