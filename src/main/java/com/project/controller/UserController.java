package com.project.controller;


import com.project.model.User;
import com.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;


@Controller
public class UserController {

    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }



    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId() == 0) this.userService.addUser(user);
        else this.userService.updateUser(user);
        return "redirect:/users ";
    }

       @RequestMapping("/remove/{id}")
        public String removeUser(@PathVariable("id") int id){
            this.userService.removeUser(id);
            return "redirect:/users";
        }

    @RequestMapping(value = "edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
            model.addAttribute("user", this.userService.getUserById(id));
            model.addAttribute("listUsers", this.userService.listUsers());

            return "redirect:/userdata";
    }

    //Создаем отдельные страницы. Например, эта страница чтобы просмотреть пользователя отдельно
    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        return "userdata";
    }


    @RequestMapping(value = "users", method = RequestMethod.GET)
    public ModelAndView listUsers(@RequestParam(required = false) Integer page, @RequestParam(value = "searchName", required = false) String name) {
        ModelAndView modelAndView = new ModelAndView("users");

        List<User> users = new ArrayList<User>();
           if(name == null || name.isEmpty())   users =  userService.listUsers();
           else {
               for(User user : userService.listUsers()){
                   String userName = user.getName().toLowerCase();
                   if(userName.contains(name.toLowerCase()))  users.add(user);
               }
             }
             if(users == null) userService.listUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());

        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page=1;

        modelAndView.addObject("page", page);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listUsers", pagedListHolder.getPageList());
        }

        modelAndView.addObject("user", new User());

        System.out.println(users.size()+"= SIZE USERS");
        return modelAndView;
    }


}