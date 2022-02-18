package com.hb.domain;

//import org.springframework.stereotype.Repository;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import oracle.sql.DATE;

@Data
@AllArgsConstructor
@NoArgsConstructor
//@Repository
public class Product {
	
	private int pd_seq;
	private String pd_type;
	private String pd_name;
	private float pd_interest;
	private String pd_interest_type;
	private DATE pd_term;
	private int pd_manager; 

}
