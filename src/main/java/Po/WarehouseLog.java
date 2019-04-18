package Po;

public class WarehouseLog {
    private int id;
    private int goods_id;
    private int warehouse_id;
    private int handlers_id;
    private int factory_id;
    private int client_id;
    private String out_put;
    private String date;
    private String sum;
    private String current_inventory;

    public String getCurrent_inventory() {
        return current_inventory;
    }

    public void setCurrent_inventory(String current_inventory) {
        this.current_inventory = current_inventory;
    }

    public int getClient_id() {
        return client_id;
    }

    public void setClient_id(int client_id) {
        this.client_id = client_id;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }

    public int getFactory_id() {
        return factory_id;
    }

    public void setFactory_id(int factory_id) {
        this.factory_id = factory_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public int getWarehouse_id() {
        return warehouse_id;
    }

    public void setWarehouse_id(int warehouse_id) {
        this.warehouse_id = warehouse_id;
    }

    public int getHandlers_id() {
        return handlers_id;
    }

    public void setHandlers_id(int handlers_id) {
        this.handlers_id = handlers_id;
    }

    public String getOut_put() {
        return out_put;
    }

    public void setOut_put(String out_put) {
        this.out_put = out_put;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "WarehouseLog{" +
                "id=" + id +
                ", goods_id=" + goods_id +
                ", warehouse_id=" + warehouse_id +
                ", handlers_id=" + handlers_id +
                ", factory_id=" + factory_id +
                ", client_id=" + client_id +
                ", out_put='" + out_put + '\'' +
                ", date='" + date + '\'' +
                ", sum='" + sum + '\'' +
                ", current_inventory='" + current_inventory + '\'' +
                '}';
    }
}
