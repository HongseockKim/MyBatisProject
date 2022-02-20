package com.example.demo.mapper;

import com.example.demo.model.Todo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Mapper
@Repository
@Transactional
public interface TodoMapper {
    List<Todo> findAll();
    void inserTodo(Todo todo);
    void deleteItem(long id);
}
