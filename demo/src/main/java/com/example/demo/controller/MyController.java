package com.example.demo.controller;


import com.example.demo.model.Todo;
import com.example.demo.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
    @Autowired MyService service;

    @RequestMapping(value ={"/","","index.do","index"}, method = RequestMethod.GET)
    public String getMain(Model model) {

        model.addAttribute("todoList",service.getTodo());

        System.out.println("메인");


        return "index";
    }

    @RequestMapping(value= {"/addTodo"}, method= RequestMethod.POST)
    public String getTodo(Todo todo){
        if(service.insertTodo(todo)) {
            System.out.println("성공");
        }
        return "redirect:index";
    }
}
