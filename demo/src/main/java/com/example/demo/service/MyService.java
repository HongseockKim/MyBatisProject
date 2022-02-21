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
}
