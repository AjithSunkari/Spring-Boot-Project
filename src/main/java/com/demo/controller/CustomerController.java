package com.demo.controller;

import com.demo.dto.CustomerDTO;
import com.demo.model.Customer;
import com.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {

    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    // Create a new customer
    @PostMapping("/create")
    public String createCustomer(CustomerDTO customerDTO, Model model) {
        // Save the customer and get the saved customer object
        Customer customer = customerService.save(customerDTO);
        model.addAttribute("successMessage", "Customer created successfully!");
        model.addAttribute("customer", customer);

        return "customer-created"; // This will render the customer-created.jsp
    }

    // Get all customers
    @GetMapping("/all")
    public ModelAndView getAllCustomers() {
        List<Customer> customers = customerService.findAll(); // Fetch all customers
        ModelAndView modelAndView = new ModelAndView("allCustomerDetails");
        modelAndView.addObject("customers", customers); // Add customers list to the model
        return modelAndView;
    }

    // Get a customer by ID (using searchById)
    @GetMapping("/{id}")
    public ModelAndView getCustomerById(@PathVariable Long id) {
        Customer customer = customerService.findById(id);
        ModelAndView modelAndView = new ModelAndView("customerDetails"); // Refers to the JSP for customer details
        if (customer != null) {
            modelAndView.addObject("customer", customer);  // Add customer to the model
        } else {
            modelAndView.addObject("error", "Customer not found."); // Add error message if customer not found
            modelAndView.setViewName("error"); // Redirect to error.jsp or any other error view
        }
        return modelAndView;
    }

    // Update a customer
    @PostMapping("update/{id}")
    public ModelAndView updateCustomer(@PathVariable Long id, CustomerDTO customerDTO) {
        Customer updatedCustomer = customerService.update(id, customerDTO);
        
        if (updatedCustomer != null) {
            // If the update is successful, return the success page with a success message
            ModelAndView modelAndView = new ModelAndView("updatedSuccessfully");
            modelAndView.addObject("message", "Customer updated successfully!");
            return modelAndView;
        } else {
            // If the update fails (e.g., customer not found), you can return an error page or message
            ModelAndView modelAndView = new ModelAndView("error");
            modelAndView.addObject("message", "Customer update failed.");
            return modelAndView;
        }
    }

    // Search by name
    @GetMapping("/searchByName")
    public Optional<String> searchByName(@RequestParam String name) {
        return customerService.searchCustomerByName(name);
    }
    
 // Search by Email
    @GetMapping("/searchByEmail")
    public Optional<Customer> searchByEmail(@RequestParam String email) {
        return customerService.searchByEmail(email);
    }
    
    @GetMapping("/searchById")
    public ResponseEntity<Customer> searchById(@RequestParam Long id) {
        Optional<Customer> customer = customerService.searchById(id);
        if (customer.isPresent()) {
            return ResponseEntity.ok(customer.get());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }
    
}