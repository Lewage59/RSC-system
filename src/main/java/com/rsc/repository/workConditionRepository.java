package com.rsc.repository;

import com.rsc.dataobject.mapper.workCondition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface workConditionRepository extends JpaRepository<workCondition,Integer> {

    @Query("select w from workCondition w inner join w.postmans p where p.id=?1")
    workCondition findworkConditionsById(Integer id);

    @Query(value = "select * from work_condition w where w.postman_id=?1 and month(w.date)=?2",nativeQuery = true)
    workCondition findMonthByPostmansId(Integer postmanId, Integer month);

    @Query(value = "select * from work_condition w where w.postman_id=?1 and month(w.date)=?2",nativeQuery = true)
    workCondition findByPostmanId(Integer postmanId,Integer month);

    @Query(value = "select SUM(receipt) as rsum, SUM(deliver) as dsum from work_condition w where month(w.date)=?1",nativeQuery = true)
    List<Map<String,Object>> findMonthworksByDate(Integer month);

    @Query(value = "select * from work_condition w where month(w.date)=?1",nativeQuery = true)
    List<workCondition> findMonthPostmansByDate(Integer month);



}