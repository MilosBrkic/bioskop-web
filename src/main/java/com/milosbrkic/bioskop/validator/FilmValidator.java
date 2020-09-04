/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.validator;

import com.milosbrkic.bioskop.domen.Film;
import com.milosbrkic.bioskop.domen.Projekcija;
import com.milosbrkic.bioskop.repository.FilmRepository;
import com.milosbrkic.bioskop.repository.ProjekcijaRepository;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author milos
 */
@Component
public class FilmValidator implements Validator{

    private final FilmRepository filmRepository;
    private final ProjekcijaRepository projekcijaRepository;

    @Autowired
    public FilmValidator(FilmRepository filmRepository, ProjekcijaRepository projekcijaRepository) {
        this.filmRepository = filmRepository;
        this.projekcijaRepository = projekcijaRepository;
    }
    
    
    
    @Override
    public boolean supports(Class<?> type) {
        return Film.class.equals(type);
    }

    

    @Override
    public void validate(Object o, Errors errors) {
        Film film = (Film) o;
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "naziv", "film.naziv.empty");
        
        if(film.getTrajanje() < 0)
            errors.rejectValue("trajanje", "film.trajanje.size");
        
        if(film.getZanrovi() == null || film.getZanrovi().isEmpty())
            errors.rejectValue("zanrovi", "film.zanrovi.size");
        
        if(film.getDistributer() == null)
            errors.rejectValue("distributer", "film.distributer.empty");
        
        if(film.getReziser()== null)
            errors.rejectValue("reziser", "film.reziser.empty");
        
        
        List<Film> filmovi = filmRepository.findByQuery("select f from Film f where f.naziv='"+film.getNaziv()+"'");
        if(filmovi != null && !filmovi.isEmpty() && film.getId() == 0)
            errors.rejectValue("naziv", "film.naziv.unique");
        
        if(film.getId() != 0){
            List<Projekcija> sve = projekcijaRepository.findByQuery("select p from Projekcija p where film = "+film.getId());
            List<Projekcija> buduce = new LinkedList<>();
            
            for(Projekcija p : sve)
            if(!Common.isInPast((Projekcija) p))
                buduce.add(p);
            
            if(!buduce.isEmpty()){//ukoliko postoje buduce projekcije za ovaj film
                
                //TODO vreme
                
                if(!film.isAktivan())
                    errors.rejectValue("aktivan", "film.aktivan.invalid");
            }
        }
    }
    
}
