package ServiceImpl;

import Mapper.GoodsMapper;
import Po.Goods;
import Service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;
    @Override
    public Goods findGoodsById(int id) {
        return goodsMapper.findGoodsById(id);
    }

    @Override
    public int addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Override
    public int delGoodsById(int id) {
        return goodsMapper.delGoodsById(id);
    }

    @Override
    public int updGoods(Goods goods) {
        return goodsMapper.updGoods(goods);
    }

    @Override
    public List<Goods> findAll() {
        return goodsMapper.findAll();
    }

    @Override
    public int findAllSum() {
        return goodsMapper.findAllSum();
    }

    @Override
    public List<Goods> findGoodsByNameLike(String name) {
        return goodsMapper.findGoodsByNameLike(name);
    }

}
