/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.controller;

import com.milosbrkic.bioskop.domen.Distributer;
import com.milosbrkic.bioskop.domen.Film;
import com.milosbrkic.bioskop.domen.Osoba;
import com.milosbrkic.bioskop.domen.Zanr;
import com.milosbrkic.bioskop.service.DistributerService;
import com.milosbrkic.bioskop.service.FilmService;
import com.milosbrkic.bioskop.service.OsobaService;
import com.milosbrkic.bioskop.service.ZanrService;
import com.milosbrkic.bioskop.validator.FilmValidator;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author milos
 */
@Controller
@RequestMapping(value = "/film")
public class FilmController {
    
    private final FilmService filmService;
    private final DistributerService distributerService;
    private final ZanrService zanrDepository;
    private final OsobaService osobaService;
    
    private final FilmValidator filmValidator;
    private final MessageSource messageSource;

    @Autowired
    public FilmController(FilmService filmService, DistributerService distributerService, ZanrService zanrDepository, OsobaService osobaService, FilmValidator filmValidator, MessageSource messageSource) {
        this.filmService = filmService;
        this.distributerService = distributerService;
        this.zanrDepository = zanrDepository;
        this.osobaService = osobaService;
        this.filmValidator = filmValidator;
        this.messageSource = messageSource;
    }
      
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(filmValidator);
    }
  
        
    
    @GetMapping
    public ModelAndView home() {
        ModelAndView model = new ModelAndView("film/home");
        model.addObject("filmovi", filmService.getAll());
        return model;
    }
    
    @GetMapping(path = "search")
    public ModelAndView search(@ModelAttribute(name = "film") Film film) {       
        ModelAndView model = new ModelAndView("film/home");
        model.addObject("filmovi", filmService.findByQuery("select f from Film f where naziv like '%"+film.getNaziv()+"%'"));
        return model;
    }
    
    
    @GetMapping(path = "add")
    public ModelAndView add() {
        ModelAndView model = new ModelAndView("film/add");
        return model;
    }
    
    @GetMapping(path = "/{numberId}/edit")
    public ModelAndView edit(@PathVariable(name = "numberId") int numberId) {
        ModelAndView model = new ModelAndView("film/edit");        
        Film film = filmService.findById(numberId);
        model.addObject("osobe", osobaService.getAll());
        model.addObject("film", film);
        return model;
    }
    
    @GetMapping(path = "/{numberId}/view")
    public ModelAndView view(@PathVariable(name = "numberId") int numberId) {
        ModelAndView model = new ModelAndView("film/view");      
        Film film = filmService.findById(numberId);;
        model.addObject("film", film);
        return model;
    }
    
    @PostMapping(path = "save")
    public String save(@ModelAttribute(name = "film") @Validated Film film, BindingResult result, RedirectAttributes redirectAttributes, Model model, Locale locale){  
        if (result.hasErrors()) {
            model.addAttribute("sala", film);
            return "film/add";
        } else {
            filmService.save(film);
            String message = messageSource.getMessage("film.save" ,null, locale);
            redirectAttributes.addFlashAttribute("message", message);
            return "redirect:/film/add";
        }
    }
    
    @PostMapping(path = "/{numberId}/save")
    public String update(@ModelAttribute(name = "film") @Validated Film film, BindingResult result, RedirectAttributes redirectAttributes, Model model, @PathVariable(name = "numberId") int numberId, Locale locale){
                  
        film.setId(numberId);
      
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("film", film);
            return "film/edit";
        } else {
            filmService.save(film);
            redirectAttributes.addFlashAttribute("message", messageSource.getMessage("film.update" ,null, locale));
            return "redirect:/film/"+numberId+"/view";
        }
        
    }
    
    @GetMapping(value = "/{numberId}/delete")
    public String delete(@PathVariable(name = "numberId") int numberId, RedirectAttributes redirectAttributes, Locale locale) {
        try {
            filmService.deleteById(numberId);
            String message = messageSource.getMessage("film.delete" ,new Object[]{numberId}, locale);
            redirectAttributes.addFlashAttribute("message", message);
        } catch (Exception ex) {
            String error = messageSource.getMessage("film.delete.error" ,new Object[]{numberId}, locale);
            redirectAttributes.addFlashAttribute("error", error);
        } 
        return "redirect:/film";
        
    }
    
    
    
         
    
    @ModelAttribute(name = "film")
    private Film getFilm() {
        return new Film();
    }
    
    @ModelAttribute(name = "distributeri")
    private List<Distributer> getDistributeri() {
        return distributerService.getAll();
    }
    
    @ModelAttribute(name = "osobe")
    private List<Osoba> getOsobe() {
        return osobaService.getAll();
    }
    
    @ModelAttribute(name = "reziseri")
    private List<Osoba> getReziseri() {
        return osobaService.getAll();
    }
    
    @ModelAttribute(name = "zanroviSvi")
    private List<Zanr> getZanrovi() {
        return zanrDepository.getAll();
    }
}
