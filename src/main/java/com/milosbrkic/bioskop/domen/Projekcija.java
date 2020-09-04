/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.milosbrkic.bioskop.domen;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author milos
 */
@Entity
@Table(name = "projekcije")
public class Projekcija implements Serializable{
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    
    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "film")
    private Film film;
    
    
    @ManyToOne(cascade = CascadeType.MERGE)
    @JoinColumn(name = "sala")
    private Sala sala;
    
    private Date datum;
    private Time vreme;
    
    @OneToMany(
        mappedBy="projekcija",
        fetch = FetchType.LAZY,
        cascade = CascadeType.ALL,
        orphanRemoval = true
    )
    private List<Karta> karte;

    public List<Karta> getKarte() {
        return karte;
    }

    public void setKarte(List<Karta> karte) {
        this.karte = karte;
    }

    public Projekcija(Film film, Sala sala, Date datum, Time vreme) {
        this.film = film;
        this.sala = sala;
        this.datum = datum;
        this.vreme = vreme;
    }

    public Time getVreme() {
        return vreme;
    }

    public void setVreme(Time vreme) {
        this.vreme = vreme;
    }

    public Projekcija() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public Sala getSala() {
        return sala;
    }

    public void setSala(Sala sala) {
        this.sala = sala;
    }

    public Date getDatum() {
        return datum;
    }
    
    public String getFormatDatum(){
        if(datum != null)
            return new SimpleDateFormat("dd.MM.yyyy.").format(datum);
        else
            return "-";
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    @Override
    public String toString() {
        return new SimpleDateFormat("dd.MM.yyyy.").format(datum)+" "+film.getNaziv()+" u "+vreme+" sala "+sala.getBrojSale();
    }
       
  
}
