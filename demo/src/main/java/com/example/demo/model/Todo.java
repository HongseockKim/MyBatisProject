package com.example.demo.model;

import lombok.Data;


@Data
public class Todo {
    private long id;
    private String todo;
    private Boolean todo_set;
    private String createdDate;
    private String total;
    private String imageSrc;
    private String todoTotal;
    private String  dates;
}
