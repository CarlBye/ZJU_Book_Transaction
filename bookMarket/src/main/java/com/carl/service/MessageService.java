package com.carl.service;

import com.carl.pojo.Message;

import java.util.List;

public interface MessageService {
    void addMessage(Message message);

    List<Message> selectBySenderId(Integer send_id);

    List<Message> selectByReceiverId(Integer receiver_id);
}
