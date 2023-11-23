package com.example.pp2023_pj4_2.bean;

import java.util.Date;

public class MemberVO {
    private int id;
    private String name;
    private String local_planet;
    private String species;
    private String purpose;
    private Date regdate;

    public MemberVO(String name, String local_planet, String species, String purpose) {
        this.name = name;
        this.local_planet = local_planet;
        this.species = species;
        this.purpose = purpose;
    }
    public MemberVO(int id, String name, String local_planet, String species, String purpose) {
        this.id = id;
        this.name = name;
        this.local_planet = local_planet;
        this.species = species;
        this.purpose = purpose;
    }
    public MemberVO() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocal_planet() {
        return local_planet;
    }

    public void setLocal_planet(String local_planet) {
        this.local_planet = local_planet;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
}
