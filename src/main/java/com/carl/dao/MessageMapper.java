package com.carl.dao;

import com.carl.pojo.Message;

import java.util.List;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKeyWithBLOBs(Message record);

    int updateByPrimaryKey(Message record);

    void addMessage(Message message);

    List<Message> selectBySenderId(Integer send_id);

    List<Message> selectByReceiverId(Integer receiver_id);
}