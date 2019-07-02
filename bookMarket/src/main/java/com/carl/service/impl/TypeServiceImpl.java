package com.carl.service.impl;

import com.carl.dao.TypeMapper;
import com.carl.pojo.Type;
import com.carl.service.TypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("typeService")
public class TypeServiceImpl implements TypeService {

    @Resource
    private TypeMapper typeMapper;

    public Type selectByPrimaryKey(Integer id){
        Type type = typeMapper.selectByPrimaryKey(id);
        return type;
    }
    public int updateByPrimaryKey(Type type) {
        return  typeMapper.updateByPrimaryKey(type);
    }
    public List<Type> getAllType() {
        List<Type> types = typeMapper.getAllType();
        return types;
    }
    public int updateTypeNum(Integer id,Integer number) {
        return typeMapper.updateTypeNum(id,number);
    }
}
