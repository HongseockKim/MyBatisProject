package com.example.demo.controller;


import com.example.demo.model.Todo;
import com.example.demo.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MyController {
    @Autowired MyService service;

    public MyController() {
    }

    @RequestMapping(value ={"/","","index.do","index"}, method = RequestMethod.GET)
    public String getMain(Model model) {

        System.out.println("service.findTodo() = " + service.findTodo());

        model.addAttribute("todoList",service.getTodo());
        model.addAttribute("todoCheck",service.findTodo());

        return "index";
    }

    @RequestMapping(value= {"/addTodo"}, method= RequestMethod.POST)
    public String getTodo(Todo todo){
        if(service.insertTodo(todo)) {
            System.out.println("성공");
        }
        return "redirect:index";
    }

    @GetMapping(value={"/delete"})
    public String deleteId(@RequestParam long id){
        service.deleteItem(id);
        return "index";
    }

    @GetMapping("/detail")
    public  String  getDetailTodo(@RequestParam long id,Model Model) {
        Model.addAttribute("todoDetail",service.getDetailTodo(id));
        return "detail";
    }

    @GetMapping("/success")
    public String getSuccessTodo(@RequestParam long id) {
        System.out.println("id = " + id);
        service.updateTodoSet(id);
        return "index";
    }

    @GetMapping("/expansion")
    public String getExpansionTodo(@RequestParam long getCheckId,Model CheckTodo){
        System.out.println("getCheckId = " + getCheckId);
        CheckTodo.addAttribute("CheckTodo",service.expansionCheck(getCheckId));
        return "expansion";
    }
}
