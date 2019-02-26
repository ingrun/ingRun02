package Controller;

import Po.Client;
import Service.ClientService;
import com.github.pagehelper.PageHelper;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.bind.util.JAXBSource;
import java.util.List;

@Controller
public class ClientController {

    @Autowired
    private ClientService clientService;

    //返回所有客户信息
    @RequestMapping(value = "client/findAllClient", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAllClient(){
        List<Client> clients = clientService.findAll();
        JSONArray jsonArray = JSONArray.fromObject(clients);
        return jsonArray.toString();
    }


    //返回所有客户信息 Page
    @RequestMapping(value = "client/findAll", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String findAll(int pageNum,int pageSize){
        int sum = clientService.findSum();
        PageHelper.startPage(pageNum,pageSize);
        List<Client> clients = clientService.findAll();
        JSONArray jsonArray = JSONArray.fromObject(clients);
        return "{\"total\":"+sum+",\"rows\":"+jsonArray.toString()+"}";
    }

    //添加客户信息
    @RequestMapping(value = "client/addClient", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String addClient(String  name,String sex,String phone,String address){
        Client client = new Client();
        client.setName(name);
        client.setPhone(phone);
        if (sex!=null)
            client.setSex(sex);
        if (address!=null)
            client.setAddress(address);
        if (clientService.addClient(client) > 0){
            return "ok";
        }
        return "error";
    }

    //删除客户信息
    @RequestMapping(value = "client/delClient", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String delClient(int id){
        if (clientService.delClient(id) > 0){
            return "ok";
        }
        return "error";
    }

    //修改客户信息
    @RequestMapping(value = "client/updClient", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String updClient(int id,String name,String sex,String phone,String address){
        Client client = new Client();
        client.setId(id);
        client.setName(name);
        client.setPhone(phone);
        if (sex!=null)
            client.setSex(sex);
        if (address!=null)
            client.setAddress(address);

        if (clientService.updClient(client) > 0){
            return "ok";
        }
        return "error";
    }

}
