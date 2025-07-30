package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.ClubHouse;

@Repository
public interface ClubHouseRepository extends JpaRepository<ClubHouse, Integer>{

	List<ClubHouse> findByAdminApproval(String status);
	
	
}
