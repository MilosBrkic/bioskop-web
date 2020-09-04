/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.controller;

import com.milosbrkic.bioskop.domen.Zaposleni;
import com.milosbrkic.bioskop.service.ZaposleniService;
import com.milosbrkic.bioskop.validator.UserValidator;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author milos
 */
@Controller
public class UserController {
    
    public final ZaposleniService zaposleniService;
    public final UserValidator validator;
    private final MessageSource messageSource;

    @Autowired
    public UserController(ZaposleniService zaposleniService, UserValidator validator, MessageSource messageSource) {
        this.zaposleniService = zaposleniService;
        this.validator = validator;
        this.messageSource = messageSource;
    }
    
    @InitBinder
    private void initBinder(WebDataBinder binder) {
        binder.setValidator(validator);     
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
         
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model, String error, String logout) {
         
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "register";
    }
    
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPost(@ModelAttribute(name = "zaposleni") @Validated Zaposleni zaposleni, BindingResult result, RedirectAttributes redirectAttributes, Model model,Locale locale) {

        if(result.hasErrors()){
            model.addAttribute("zaposleni", zaposleni);
            return "register";
        }
        else{
            zaposleniService.save(zaposleni);
            
            redirectAttributes.addFlashAttribute("message", messageSource.getMessage("register.success" ,null, locale));
            return "redirect:/register";
        }   
        
    }
    
   
    @ModelAttribute(name = "zaposleni")
    public Zaposleni getUser(){
        return new Zaposleni();
    }
    
    
}
