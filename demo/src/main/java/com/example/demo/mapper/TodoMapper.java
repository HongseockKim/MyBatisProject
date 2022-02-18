package com.example.demo.mapper;

import com.example.demo.model.Todo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TodoMapper {
    List<Todo> findAll();
    void inserTodo(Todo todo);
}
