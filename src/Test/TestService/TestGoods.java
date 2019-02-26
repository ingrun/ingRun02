package TestService;

import Mapper.GoodsMapper;
import Po.Goods;
import Service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestGoods {

    @Autowired
    private GoodsService goodsService;

//    @Test
//    public void testfindGoodsByNameLike(){
//        List<Goods> goodss =  goodsService.findGoodsByNameLike("200");
//        for(Goods goods : goodss){
//            System.out.println(goods);
//        }
//
//    }
//
//    @Test
//    public void testfindSum(){
//        int i = goodsService.findAllSum();
//        System.out.println(i);
//    }
//

}
