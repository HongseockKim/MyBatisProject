package com.example.demo.controller;


import com.example.demo.model.ContentVo;
import com.example.demo.model.Todo;
import com.example.demo.service.MyService;
import lombok.AllArgsConstructor;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
@AllArgsConstructor
public class MyController {
    @Autowired MyService service;
    protected static Logger logger = Logger.getLogger(MyController.class);

    @RequestMapping(value ={"/","","index.do","index"}, method = RequestMethod.GET)
    public String getMain(Model model) {
        try{
            model.addAttribute("todoList",service.getTodo());
            model.addAttribute("todoCheck",service.findTodo());
            model.addAttribute("contentList",service.getContent());
        }catch(Exception e){
            logger.error(e);
        }

        return "index";
    }

    @RequestMapping(value= {"/addTodo"}, method= RequestMethod.POST)
    public String getTodo(Todo todo){
        try{
            if(service.insertTodo(todo)) {
                System.out.println("성공");
            }
        }catch (Exception e){
            logger.error(e);
        }

        return "redirect:index";
    }

    @GetMapping(value={"/delete"})
    public String deleteId(@RequestParam long id){
        try{
            service.deleteItem(id);
        } catch (Exception e){
            logger.error(e);
        }

        return "index";
    }

    @GetMapping("/detail")
    public  String  getDetailTodo(@RequestParam long id,Model Model) {
        try {
            Model.addAttribute("todoDetail",service.getDetailTodo(id));
        } catch (Exception e){
            logger.error(e);
        }

        return "detail";
    }

    @GetMapping("/success")
    public String getSuccessTodo(@RequestParam long id) {
        try{
            System.out.println("id = " + id);
            service.updateTodoSet(id);
        }catch (Exception e){
            logger.error(e);
        }

        return "index";
    }

    @GetMapping("/expansion")
    public String getExpansionTodo(@RequestParam long getCheckId,Model CheckTodo){
        try{
            System.out.println("getCheckId = " + getCheckId);
            CheckTodo.addAttribute("CheckTodo",service.expansionCheck(getCheckId));
        }catch(Exception e){
            logger.error(e);
        }

        return "expansion";
    }


    @PostMapping(value = "/addcontent",produces = "application/json; charset=utf-8")
    public @ResponseBody String  getContentSave(ContentVo contentVo){
        JSONObject json = new JSONObject();
        try{
            String content = contentVo.getContent();
            json.put("result",  service.SaveContent(contentVo));
            System.out.println("json.toString() = " + json.toString());
        }catch(Exception e){
            logger.error(e);
            json.put("result",  false);
        }
        return json.toString();
    }

    @GetMapping(value = "/reference/list",produces="application/json")
    public @ResponseBody String getTodoList(){
        JSONObject json = new JSONObject();

        try{
            json.put("todoList", service.getTodo());
        }catch(Exception e){
            logger.error(e);
        }


        return json.toString();
    }
}
