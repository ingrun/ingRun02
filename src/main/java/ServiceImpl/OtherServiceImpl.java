package ServiceImpl;

import Mapper.OtherMapper;
import Po.FactorySite;
import Service.OtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OtherServiceImpl implements OtherService {
    @Autowired
    private OtherMapper otherMapper;

    @Override
    public List<FactorySite> findAllFactorySite() {
        return otherMapper.findAllFactorySite();


    }

    @Override
    public FactorySite findFactorySiteById(int id) {
        return otherMapper.findFactorySiteById(id);
    }
}
