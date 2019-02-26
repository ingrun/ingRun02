package Mapper;

import Po.Handlers;

import java.util.List;

public interface HandlersMapper {

    public List<Handlers> findAll();
    public Handlers findHandlersById(int id);
}
