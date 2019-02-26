package Service;

import Po.Handlers;

import java.util.List;

public interface HandlersService {

    public List<Handlers> findAll();
    public Handlers findHandlersById(int id);
}
