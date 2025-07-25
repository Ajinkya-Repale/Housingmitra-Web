package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.Staff;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Integer>{

	List<Staff> findByAdminName(String aname);
	

}
