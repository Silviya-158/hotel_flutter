package com.example.demo.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.example.demo.model.Booking;
import com.example.demo.repository.BookingRepository;

@Service
public class BookingService {

    private final BookingRepository repo;

    public BookingService(BookingRepository repo) {
        this.repo = repo;
    }

    public List<Booking> getAll() {
        return repo.findAll();
    }

    public Booking save(Booking booking) {
        return repo.save(booking);
    }
}