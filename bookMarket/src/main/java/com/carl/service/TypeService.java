package com.carl.service;

import com.carl.pojo.Type;

import java.util.List;

public interface TypeService {
    Type selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(Type record);
    List<Type> getAllType();
    int updateTypeNum(Integer id, Integer number);
}
