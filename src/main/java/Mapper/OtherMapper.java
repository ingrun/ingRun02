package Mapper;

import Po.FactorySite;

import java.util.List;

public interface OtherMapper {

    public List<FactorySite> findAllFactorySite();
    public FactorySite findFactorySiteById(int id);

}
