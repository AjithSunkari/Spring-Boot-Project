package com.demo.service;

import com.demo.dto.CustomerDTO;
import com.demo.model.Customer;
import com.demo.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    // Create a new customer
    public Customer save(CustomerDTO customerDTO) {
        Customer customer = new Customer();
        customer.setName(customerDTO.getName());
        customer.setGender(customerDTO.getGender());
        customer.setEmail(customerDTO.getEmail());
        customer.setPhoneNumber(customerDTO.getPhoneNumber());
        customer.setDob(customerDTO.getDob());
        customer.setAddress(customerDTO.getAddress());
        customer.setNetworth(customerDTO.getNetworth());

        return customerRepository.save(customer);
    }

    // Get all customers
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    // Get a customer by ID
    public Customer findById(Long id) {
        return customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
    }

    // Update a customer
    public Customer update(Long id, CustomerDTO customerDTO) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Customer not found"));

        customer.setName(customerDTO.getName());
        customer.setGender(customerDTO.getGender());
        customer.setPhoneNumber(customerDTO.getPhoneNumber());
        customer.setEmail(customerDTO.getEmail());
        customer.setDob(customerDTO.getDob());
        customer.setAddress(customerDTO.getAddress());
        customer.setNetworth(customerDTO.getNetworth());

        return customerRepository.save(customer);
    }

    // Search by name
    public Optional<String> searchCustomerByName(String name) {
        Optional<Customer> customer = customerRepository.findByName(name);
        if (customer.isPresent()) {
            return Optional.of(customer.get().getName());  // Return name if found
        } else {
            return Optional.empty();  // Return Optional.empty if not found
        }
    }
    
 // Search customer by Email
    public Optional<Customer> searchByEmail(String email) {
        return customerRepository.findByEmail(email);
    }
    
 // Search customer by ID
    public Optional<Customer> searchById(Long id) {
        return customerRepository.findById(id);  // Use the existing method that finds by ID
    }

}