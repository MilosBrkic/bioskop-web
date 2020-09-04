/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.milosbrkic.bioskop.domen;

import java.io.Serializable;
import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author milos
 */
@Entity
@Table(name = "sale")
@Cacheable(false)
public class Sala implements Serializable{

    @Id
    @Column(name = "id")
    private int brojSale;
    
    @Column(name = "broj_sedista")
    private int brojSedista;

    public Sala(int brojSale, int brojSedista) {
        this.brojSale = brojSale;
        this.brojSedista = brojSedista;
    }

    public Sala() {      
    }

    public int getBrojSale() {
        return brojSale;
    }

    public void setBrojSale(int brojSale) {
        this.brojSale = brojSale;
    }

    public int getBrojSedista() {
        return brojSedista;
    }

    public void setBrojSedista(int brojSedista) {
        this.brojSedista = brojSedista;
    }

    @Override
    public String toString() {
        return "Sala "+brojSale+" ("+brojSedista+" sedišta)";
    }

    
       
}
