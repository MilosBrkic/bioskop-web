/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.validator;

import com.milosbrkic.bioskop.domen.Distributer;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 *
 * @author milos
 */
@Component
public class DistributerValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Distributer.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "naziv", "film.naziv.empty");
    }
    
}
