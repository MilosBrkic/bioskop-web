/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.service;

import com.milosbrkic.bioskop.domen.Zaposleni;
import com.milosbrkic.bioskop.repository.ZaposleniRepository;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author milos
 */
@Service
public class ZaposleniService extends AbstractService<Zaposleni, ZaposleniRepository> implements UserDetailsService{

    public ZaposleniService(ZaposleniRepository repository) {
        super(repository);
    }

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Zaposleni zap = repository.findByName(username);     
        Set < GrantedAuthority > grantedAuthorities = new HashSet < > ();
        
        grantedAuthorities.add(new SimpleGrantedAuthority("USER"));
        
        if(zap.getStatus().equals("admin"))
            grantedAuthorities.add(new SimpleGrantedAuthority("ADMIN"));    
       
        return new org.springframework.security.core.userdetails.User(zap.getUsername(), zap.getPassword(), grantedAuthorities);
    }
    
    public Zaposleni findByName(String name){
        return repository.findByName(name);
    }
    
    @Override
    public Zaposleni findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<Zaposleni> getAll() {
        return repository.getAll();
    }

    @Override
    public void save(Zaposleni z) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        z.setPassword(encoder.encode(z.getPassword())); 
        z.setStatus("zaposleni");
        repository.save(z);
    }

    @Override
    public void deleteById(int id) throws Exception {
        repository.deleteById(id);
    }

    @Override
    public List<Zaposleni> findByQuery(String query) {
        return repository.findByQuery(query);
    }
    
}
