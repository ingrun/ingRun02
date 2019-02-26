package Mapper;

import Po.Goods;

import java.util.List;

public interface GoodsMapper {

    public int addGoods(Goods goods);
    public int delGoodsById(int id);
    public int updGoods(Goods goods);
    public Goods findGoodsById(int id);
    public List<Goods> findGoodsByNameLike(String name);
    public List<Goods> findAll();
    public int findAllSum();
}
