package com.example.demo.controller;


import com.example.demo.model.Todo;
import com.example.demo.service.MyService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequiredArgsConstructor
public class MyController {
    @Autowired MyService service;

    @RequestMapping(value ={"/","","index.do","index"}, method = RequestMethod.GET)
    public String getMain(Model model) {

        System.out.println("model = " + service.getTodo());

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
}
