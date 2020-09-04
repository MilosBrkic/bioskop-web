/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.controller;

import com.milosbrkic.bioskop.domen.Karta;
import com.milosbrkic.bioskop.domen.Projekcija;
import com.milosbrkic.bioskop.domen.Zaposleni;
import com.milosbrkic.bioskop.service.ZaposleniService;
import com.milosbrkic.bioskop.service.KartaService;
import com.milosbrkic.bioskop.service.ProjekcijaService;
import com.milosbrkic.bioskop.validator.KartaValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
@RequestMapping(value = "/karta")
public class KartaController {
    
    private final KartaService kartaService;
    private final ProjekcijaService projekcijaService;
    private final ZaposleniService zaposleniService;
    private final KartaValidator validator;

    @Autowired
     public KartaController(KartaService kartaService, ProjekcijaService projekcijaService, ZaposleniService zaposleniService, KartaValidator validator) {
        this.kartaService = kartaService;
        this.projekcijaService = projekcijaService;
        this.zaposleniService = zaposleniService;
        this.validator = validator;
    }

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(validator);
    }
    
    
 
    
    @PostMapping(path = "save")
    public String save(@ModelAttribute(name = "karta") @Validated Karta karta, BindingResult result, RedirectAttributes redirectAttributes, Model model){  
        if (result.hasErrors()) {
            model.addAttribute("karta", karta);
            return "karta/add";
        } else {
            String username = SecurityContextHolder.getContext().getAuthentication().getName();
            Zaposleni z = zaposleniService.findByName(username);
            karta.setStatus("prodata");
            karta.setZaposleni(z);
            kartaService.save(karta);
            redirectAttributes.addFlashAttribute("message", "Ticket is saved");
            return "redirect:/karta/"+karta.getProjekcija().getId()+"/sell";
        }              
    }
    
    @GetMapping(path = "/{numberId}/sell")
    public ModelAndView add(@PathVariable(name = "numberId") int numberId) {
        ModelAndView model = new ModelAndView("karta/add");
        Projekcija p = projekcijaService.findById(numberId);
        Karta k = new Karta();
        k.setProjekcija(p);
        model.addObject("karta", k);
        return model;
    }
    
    @GetMapping(path = "/{numberId}/delete")
    public ModelAndView delete(@PathVariable(name = "numberId") int numberId) {
        //ModelAndView model = new ModelAndView("redirect:/karta/"+numberId+"/sell");
        ModelAndView model = new ModelAndView("redirect:/home");
        try {
            kartaService.deleteById(numberId);
            System.out.println("===================== delete karta success");
        } catch (Exception e) {
            
            //model.addObject("message", "greska");
            System.out.println("===================== delete karta error");
        }

        return model;
    }
    
    @ModelAttribute(name = "karta")
    private Karta getKarta(){
        return new Karta();
    }
    
       
}
