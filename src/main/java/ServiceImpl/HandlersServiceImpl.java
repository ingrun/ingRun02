package ServiceImpl;

import Mapper.HandlersMapper;
import Po.Handlers;
import Service.HandlersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HandlersServiceImpl implements HandlersService {
    @Autowired
    private HandlersMapper handlersMapper;
    @Override
    public List<Handlers> findAll() {
        return handlersMapper.findAll();
    }

    @Override
    public Handlers findHandlersById(int id) {
        return handlersMapper.findHandlersById(id);
    }
}
