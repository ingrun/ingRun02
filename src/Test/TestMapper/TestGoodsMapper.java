package TestMapper;

import Mapper.GoodsMapper;
import Po.Goods;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestGoodsMapper {
    @Autowired
    private GoodsMapper goodsMapper;
//    @Test
//    public void testAdd(){
//        Goods goods = new Goods();
//        goods.setName("渔网铅坠200");
//        goods.setType("200#");
//        int i = goodsMapper.addGoods(goods);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testfind(){
//        Goods goods = goodsMapper.findGoodsById(1);
//        System.out.println(goods.toString());
//    }
//
//    @Test
//    public void testdel(){
//        int i = goodsMapper.delGoodsById(1);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testupd(){
//;       Goods goods = new Goods();
//        goods.setId(2);
//        goods.setName("渔网铅坠300");
//        goods.setType("300#");
//        int i = goodsMapper.updGoods(goods);
//        System.out.println(i);
//    }

}
