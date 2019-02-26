package Service;

import Po.FactorySite;

import java.util.List;

public interface OtherService {

    public List<FactorySite> findAllFactorySite();
    public FactorySite findFactorySiteById(int id);
}
