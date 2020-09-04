/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.validator;

import com.milosbrkic.bioskop.domen.Karta;
import com.milosbrkic.bioskop.domen.Projekcija;
import com.milosbrkic.bioskop.repository.KartaRepository;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author milos
 */
@Component
public class KartaValidator implements Validator{

    private final KartaRepository kartaRepository;

    public KartaValidator(KartaRepository kartaRepository) {
        this.kartaRepository = kartaRepository;
    }
    
    
    
    @Override
    public boolean supports(Class<?> type) {
        return Karta.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Karta karta = (Karta) o;
        
        if(karta.getBrojReda() <= 0)
            errors.rejectValue("brojReda", "karta.brojReda.negative");
        
        if(karta.getBrojSedista() <= 0)
            errors.rejectValue("brojSedista", "karta.brojSedista.negative");
        
         if(karta.getCena().compareTo(BigDecimal.ZERO) == -1)
            errors.rejectValue("cena", "karta.cena.negative");
         
         if(karta.getProjekcija() == null)
             errors.rejectValue("projekcija", "karta.projekcija.empty");
         else
         {
            if(Common.isInPast(karta.getProjekcija()))
                errors.rejectValue("projekcija", "karta.projekcija.past");

            List<Karta> karte = kartaRepository.findByQuery("select k from Karta k where k.brojReda ="+karta.getBrojReda()+" and k.brojSedista = "+karta.getBrojSedista()+" and projekcija ="+karta.getProjekcija().getId());
            System.out.println("================================ karte "+karte);
            if(karte != null && !karte.isEmpty()){
                errors.rejectValue("brojReda", "karta.mesto.unique");
                errors.rejectValue("brojSedista", "karta.mesto.unique");
            }
         }
    }

}
