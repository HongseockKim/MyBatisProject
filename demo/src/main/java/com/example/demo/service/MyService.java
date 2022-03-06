package com.example.demo.service;


import com.example.demo.mapper.ContentMapper;
import com.example.demo.mapper.TodoMapper;
import com.example.demo.model.ContentVo;
import com.example.demo.model.Todo;
import lombok.AllArgsConstructor;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

@Service
@AllArgsConstructor
public class MyService {
    protected static Logger logger = Logger.getLogger(MyService.class);
    @Autowired
    TodoMapper todoMapper;
    @Autowired
    ContentMapper contentMapper;

    public List<HashMap<String, Object>> getContent(){
        logger.info(contentMapper.findAll());
        List<HashMap<String, Object>> content =  contentMapper.findAll();
        return content;
    }


    public List<Todo> getTodo(){
        List<Todo> todo = todoMapper.findAll();
        return todo;
    }

    public List<Todo> findTodo(){
        List<Todo> todoCheck = todoMapper.findTodo();
        return todoCheck;
    }

    public Boolean insertTodo(Todo todo) {
        todoMapper.inserTodo(todo);
        return true;
    }

    public Boolean deleteItem(long id) {
        todoMapper.deleteItem(id);

        return  true;
    }

    public Todo getDetailTodo(long id) {
        Todo todo = todoMapper.getDetailTodo(id);
        return  todo;
    }
    public Boolean updateTodoSet(long id) {
        todoMapper.updateTodoSet(id);
        return true;
    }

    public Todo expansionCheck(long id) {
        Todo todo = todoMapper.getDetailTodo(id);
        return todo;
    }

    public Boolean SaveContent(ContentVo contentVo){

        contentMapper.saveContent(contentVo);
        return true;
    }
}
