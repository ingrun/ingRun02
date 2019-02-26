package ServiceImpl;

import Mapper.ClientMapper;
import Po.Client;
import Service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {
    @Autowired
    private  ClientMapper clientMapper;
    @Override
    public Client findClientById(int id) {
        return clientMapper.findClientById(id);
    }

    @Override
    public int addClient(Client client) {
        return clientMapper.addClient(client);
    }

    @Override
    public int updClient(Client client) {
        return clientMapper.updClient(client);
    }

    @Override
    public int delClient(int id) {
        return clientMapper.delClient(id);
    }

    @Override
    public int findSum() {
        return clientMapper.findSum();
    }

    @Override
    public List<Client> findAll() {
        return clientMapper.findAll();
    }
}
