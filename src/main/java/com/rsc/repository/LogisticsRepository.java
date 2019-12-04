package com.rsc.repository;

import com.rsc.dataobject.mapper.Logistics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LogisticsRepository extends JpaRepository<Logistics, Integer> {

    @Query("select l from Logistics l where no = ?1")
    Logistics findByNo(Integer no);

    @Query("select l.no from Logistics l where l.saddressId = ?1")
    Integer Sno(Integer id);

    @Query("select l.no from Logistics l where l.gaddressId = ?1")
    Integer Gno(Integer id);

    @Query("select l from Logistics l")
    List<Logistics> findAll();

}
