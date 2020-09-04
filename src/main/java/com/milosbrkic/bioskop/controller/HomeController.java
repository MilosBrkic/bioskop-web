/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.controller;

import com.milosbrkic.bioskop.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author milos
 */
@Controller
public class HomeController {
  
    private final FilmService filmService;

    @Autowired
    public HomeController(FilmService filmService) {
        this.filmService = filmService;
    }
       
    @RequestMapping(value = {"", "/", "/home"}, method = RequestMethod.GET)
    public ModelAndView home() {
        ModelAndView model = new ModelAndView("home");
        model.addObject("filmovi", filmService.findByQuery("select f from Film f order by f.godina DESC"));
        return model;
    }
    
    
}
