/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.validator;

import com.milosbrkic.bioskop.domen.Zaposleni;
import com.milosbrkic.bioskop.repository.ZaposleniRepository;
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
public class UserValidator implements Validator{

    private final ZaposleniRepository repository;

    @Autowired
    public UserValidator(ZaposleniRepository repository) {
        this.repository = repository;
    }
    
  
    @Override
    public boolean supports(Class<?> type) {
        return Zaposleni.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Zaposleni zaposleni = (Zaposleni) o;
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "user.username.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "user.password.empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordMatch", "user.passwordMatch.empty");
        
        if(!zaposleni.getPassword().equals(zaposleni.getPasswordMatch()))
            errors.rejectValue("passwordMatch", "user.passwordMatch.invalid");
        
        
        Zaposleni zap = repository.findByName(zaposleni.getUsername());
        if(zap != null)
            errors.rejectValue("username", "user.username.unique");
        
    }
    
}
