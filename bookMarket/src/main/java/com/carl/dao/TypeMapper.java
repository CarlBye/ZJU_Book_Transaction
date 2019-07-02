package com.carl.dao;

import com.carl.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);


    int updateTypeNum(@Param("id") Integer id, @Param("number") Integer number);

    List<Type> getAllType();//根据商品类别查询商品
}