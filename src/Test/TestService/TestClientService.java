package TestService;

import Po.Client;
import Service.ClientService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@ContextConfiguration(locations = "classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class TestClientService {
    @Autowired
    private ClientService clientService;
//
//    @Test
//    public void testAdd(){
//        Client client = new Client();
//        client.setName("test");
//        client.setSex("男");
//        client.setPhone("12345678999");
//        client.setAddress("4dfs32132");
//        int i = clientService.addClient(client);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testUpa(){
//        Client client = new Client();
//        client.setId(1);
//        client.setName("test01");
//        client.setSex("男");
//        client.setPhone("12345678999");
//        client.setAddress("4dfs32132");
//        int i = clientService.updClient(client);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testFindById(){
//        int id = 1;
//        Client client = clientService.findClientById(id);
//        System.out.println(client.getName());
//    }
//
//    @Test
//    public void testDel(){
//        int id = 3 ;
//        int i = clientService.delClient(id);
//        System.out.println(i);
//    }
//
//    @Test
//    public void testFindAll(){
//        List<Client> clientList = clientService.findAll();
//        for(Client client : clientList){
//            System.out.println(client.getName());
//        }
//    }

}
