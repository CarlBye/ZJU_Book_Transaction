package com.carl.service.impl;

import com.carl.dao.MessageMapper;
import com.carl.pojo.Message;
import com.carl.service.MessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("messageService")
public class MessageServiceImpl implements MessageService {

    @Resource
    private MessageMapper messageMapper;

    public void addMessage(Message message){
        messageMapper.addMessage(message);
    }

    public List<Message> selectBySenderId(Integer send_id){
        return messageMapper.selectBySenderId(send_id);
    }

    public List<Message> selectByReceiverId(Integer receiver_id){
        return messageMapper.selectByReceiverId(receiver_id);
    }
}
