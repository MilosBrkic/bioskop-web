/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.repository;

import com.milosbrkic.bioskop.domen.Zaposleni;
import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author milos
 */
@Repository
@Transactional(propagation = Propagation.REQUIRED)
public class ZaposleniRepository extends AbstractRepository<Zaposleni>{

    @Override
    public Zaposleni findById(int id) {
        return entityManager.find(Zaposleni.class, id);
    }

    @Override
    public List<Zaposleni> getAll() {
        return entityManager.createQuery("select z from Zaposleni z").getResultList();
    }
    
    public Zaposleni findByName(String name){
        List<Zaposleni> lista = entityManager.createQuery("select z from Zaposleni z where z.username=:username").setParameter("username", name).getResultList();
        if(lista != null && !lista.isEmpty())
            return lista.get(0);
        else
            return null;
    }

    @Override
    public void save(Zaposleni z) {
        entityManager.merge(z);
    }

    @Override
    public void deleteById(int i) {
        
    }

    @Override
    public List<Zaposleni> findByQuery(String query) {
        return null;
    }
    
}
