package Po;

import org.omg.CORBA.PUBLIC_MEMBER;

//库存记录
public class Record {
    private int id;
    private int goods_id;
    private int warehouse_id;
    private int sum;

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

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    @Override
    public String toString() {
        return "goods_id : "+goods_id+"\n"+"warehouse_id : "+warehouse_id+"\n"+"sum : "+sum;
    }
}
