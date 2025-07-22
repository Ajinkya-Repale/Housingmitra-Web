package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.Complaint;

@Repository
public interface ComplaintRepository extends JpaRepository<Complaint, Integer>{

	List<Complaint> findByUserName(String uname);
	
	
}
