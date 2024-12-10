package com.demo.repository;

import com.demo.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

	 // Find by name
    Optional<Customer> findByName(String name);
    
    Optional<Customer> findByEmail(String email);  // Search by email
    

}
