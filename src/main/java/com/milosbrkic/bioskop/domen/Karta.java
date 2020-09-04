/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.domen;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author milos
 */
@Entity
@Table(name = "karte")
public class Karta implements Serializable{
    
    @Id 
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "broj_reda")
    private int brojReda;
    
    @Column(name = "broj_sedista")
    private int brojSedista; //u redu
    
    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "projekcija")
    private Projekcija projekcija;
    
    private BigDecimal cena;
     
    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "zaposleni")
    private Zaposleni zaposleni;
    
    private String status;

    public Karta(int brojReda, int brojSedista, Projekcija projekcija, BigDecimal cena, Zaposleni zaposleni, String status) {
        this.brojReda = brojReda;
        this.brojSedista = brojSedista;
        this.projekcija = projekcija;
        this.cena = cena;
        this.zaposleni = zaposleni;
        this.status = status;
    }

    public Karta() {
    }
    
    

    public int getBrojReda() {
        return brojReda;
    }

    public void setBrojReda(int brojReda) {
        this.brojReda = brojReda;
    }

    public int getBrojSedista() {
        return brojSedista;
    }

    public void setBrojSedista(int brojSedista) {
        this.brojSedista = brojSedista;
    }

    public Projekcija getProjekcija() {
        return projekcija;
    }

    public void setProjekcija(Projekcija projekcija) {
        this.projekcija = projekcija;
    }

    public BigDecimal getCena() {
        return cena;
    }

    public void setCena(BigDecimal cena) {
        this.cena = cena;
    }

    public Zaposleni getZaposleni() {
        return zaposleni;
    }

    public void setZaposleni(Zaposleni zaposleni) {
        this.zaposleni = zaposleni;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Karta{" + "id=" + id + ", brojReda=" + brojReda + ", brojSedista=" + brojSedista + ", projekcija=" + projekcija + ", cena=" + cena + ", zaposleni=" + zaposleni + ", status=" + status + '}';
    }

    
    
 
}
