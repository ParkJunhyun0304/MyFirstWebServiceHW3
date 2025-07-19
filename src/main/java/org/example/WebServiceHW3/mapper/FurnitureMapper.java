package org.example.WebServiceHW3.mapper;

import org.example.WebServiceHW3.vo.FurnitureVO;

import java.util.List;

public interface FurnitureMapper {
    List<FurnitureVO> getList();
    FurnitureVO getById(int id);
    void insert(FurnitureVO furniture);
    void update(FurnitureVO furniture);
    void delete(int id);
}
