package Service;

import Po.Client;

import java.util.List;

public interface ClientService {
    public Client findClientById(int id);
    public int addClient(Client client);
    public int updClient(Client client);
    public int delClient(int id);
    public int findSum();
    public List<Client> findAll();
}
