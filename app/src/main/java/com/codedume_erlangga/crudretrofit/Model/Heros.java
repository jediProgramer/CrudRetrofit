package com.codedume_erlangga.crudretrofit.Model;

import com.google.gson.annotations.SerializedName;

public class Heros {

    @SerializedName("id")
    private String id;
    @SerializedName("name")
    private String name;
    @SerializedName("description")
    private String description;
    @SerializedName("date")
    private String date;
    @SerializedName("image")
    private String image;

    public Heros(){}

    public Heros(String id, String name, String description, String date, String image) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.image = image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
