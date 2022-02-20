package com.example.demo.model;

import lombok.Data;


@Data
public class Todo {
    private long id;
    private String todo;
    private String createdDate;
}
