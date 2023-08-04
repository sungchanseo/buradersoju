package com.itwillbs.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.itwillbs.domain.EmployeeVO;
import com.itwillbs.persistence.EmployeeDAO;
import com.itwillbs.security.domain.CustomUser;

public class CustomUserDetailsService implements UserDetailsService {

	 private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
	 
	@Autowired
	private EmployeeDAO edao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		logger.debug("CustomUserDetailsService : {}", username);
		
		EmployeeVO vo = edao.read(username);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
