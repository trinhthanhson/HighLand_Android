package com.javaweb.reponsitory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.javaweb.entity.Review;

@Repository
public interface ReviewRepo extends JpaRepository<Review,Long>{

}
