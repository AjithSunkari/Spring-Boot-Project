package com.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomerDTO {
	
    private Long id;
	
	private String name;
	private String gender;
	private String phoneNumber;
	private String email;
	private String dob;
	private String address;
	private Double networth;

}
