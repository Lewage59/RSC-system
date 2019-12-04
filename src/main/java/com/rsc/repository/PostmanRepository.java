package com.rsc.repository;

import com.rsc.dataobject.mapper.Postman;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface PostmanRepository extends JpaRepository<Postman, Integer> {
    Optional<Postman> findById(Integer id);

    @Query("select p from Postman p where p.id = (select u.postmanId from Users u where u.username = ?1)")
    Postman findByEname(String ename);

    @Query(value = "select * from Postman p where p.id = " +
            "(select work_condition.postman_id from work_condition where (receipt+deliver) = \n" +
            "(SELECT MIN(receipt+deliver) FROM work_condition ) limit 1) and p.state=0 and p.etown=?1 ",nativeQuery=true)
    Postman findMinById(String town);

    @Query("select p from Postman p where p.etown = ?1 and p.state=0")
    List<Postman> findByEtown(String town);

    @Query("select p from Postman p where p.etown = ?1")
    List<Postman> findAllByEtown(String town);

    @Query("select p.state from Postman p where p.id = ?1")
    Integer findpostmanStateById(int id);

    @Query("select p from Postman p where p.id = ?1")
    List<Postman> findworkupById(String id);
}
