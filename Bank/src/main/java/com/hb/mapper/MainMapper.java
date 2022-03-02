package com.hb.mapper;

import java.util.List;

//import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hb.domain.Savings;
//import com.hb.domain.Product;
import com.hb.domain.User;

@Mapper
public interface MainMapper {
	
	//public List<Product> selectproduct();

	public void joinForm(User uservo);
	
	//public List<User> loginForm(User uservo);
	public User loginForm(User uservo);
	
	public List<Savings> savingslist();
}
