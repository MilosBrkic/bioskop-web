/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.formatter;

import com.milosbrkic.bioskop.domen.Zaposleni;
import com.milosbrkic.bioskop.repository.ZaposleniRepository;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;

/**
 *
 * @author milos
 */
public class ZaposleniFormater implements Formatter<Zaposleni>{

    private final ZaposleniRepository repository;

    @Autowired
    public ZaposleniFormater(ZaposleniRepository repository) {
        this.repository = repository;
    }
      
    @Override
    public String print(Zaposleni z, Locale locale) {
        return z.toString();
    }

    @Override
    public Zaposleni parse(String string, Locale locale) throws ParseException {
        int id = Integer.parseInt(string);
        return repository.findById(id);
    }
    
}
