package com.example.demo.service;


import com.example.demo.mapper.TodoMapper;
import com.example.demo.model.Todo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MyService {
    @Autowired TodoMapper todoMapper;

    public List<Todo> getTodo(){
        List<Todo> todo = todoMapper.findAll();
        return todo;
    }

    public Boolean insertTodo(Todo todo) {
        todoMapper.inserTodo(todo);
        return true;
    }
}
