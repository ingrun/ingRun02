package Service;

import Po.Goods;

import java.util.List;

public interface GoodsService {
    public Goods findGoodsById(int id);
    public int addGoods(Goods goods);
    public int delGoodsById(int id);
    public int updGoods(Goods goods);
    public List<Goods> findAll();
    public int findAllSum();
    public List<Goods> findGoodsByNameLike(String name);
}
