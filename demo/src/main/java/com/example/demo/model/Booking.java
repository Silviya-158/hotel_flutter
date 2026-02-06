package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String checkin;
    private String checkout;
    private String room;
    private int nights;
    private double price;
    private String promo;

    public Booking() {}

    public Booking(Integer id, String checkin, String checkout, String room,
                   int nights, double price, String promo) {
        this.id = id;
        this.checkin = checkin;
        this.checkout = checkout;
        this.room = room;
        this.nights = nights;
        this.price = price;
        this.promo = promo;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getCheckin() { return checkin; }
    public void setCheckin(String checkin) { this.checkin = checkin; }

    public String getCheckout() { return checkout; }
    public void setCheckout(String checkout) { this.checkout = checkout; }

    public String getRoom() { return room; }
    public void setRoom(String room) { this.room = room; }

    public int getNights() { return nights; }
    public void setNights(int nights) { this.nights = nights; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getPromo() { return promo; }
    public void setPromo(String promo) { this.promo = promo; }
}
