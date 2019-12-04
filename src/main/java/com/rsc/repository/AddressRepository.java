package com.rsc.repository;

import com.rsc.dataobject.mapper.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface AddressRepository extends JpaRepository<Address,Integer> {
    @Query("select a from Address a inner join a.users u where u.id=?1")
    List<Address> findAddressByUsers(Integer id);

    Optional<Address> findById(Integer id);

    @Query("select a from Address a where a.Apostman.id = ?1 and a.type like '10'")
    List<Address>findGAddressByPostmanId(Integer id);

    @Query("select a from Address a where a.Apostman.id = ?1 and a.type like '21'")
    List<Address>findSAddressByPostmanId(Integer id);

    @Query(value = "select year(create_time) as year,month(create_time) as month ,count(1) as number \n" +
            "FROM address \n" +
            "where create_time BETWEEN DATE_SUB(now(),interval 6 month) and now() \n" +
            "and type = 11 GROUP BY MONTH (create_time)",nativeQuery = true)
    List<Map<String,Object>> findSixMonthReceipt();

    @Query(value = "select month(create_time) as month ,count(*) as number \n" +
            "FROM address \n" +
            "where create_time BETWEEN DATE_SUB(now(),interval 6 month) and now() \n" +
            "and type = 22 GROUP BY MONTH (create_time)",nativeQuery = true)
    List<Map<String,Object>> findSixMonthDeliver();

    @Query(value = "select month(create_time) as month ,count(1) as number \n" +
            "FROM address \n" +
            "where create_time BETWEEN DATE_SUB(now(),interval 6 month) and now() \n" +
            "and type in (19,29) GROUP BY MONTH (create_time)",nativeQuery = true)
    List<Map<String,Object>> findSixMonthFault();

    @Query(value = "select day(create_time) as day,count(1) as number " +
            "FROM address where create_time BETWEEN DATE_SUB(now(),interval 7 day) and now() \n" +
            "and type = 11 GROUP BY day(create_time)",nativeQuery = true)
    List<Map<String,Object>> findAweekReceipt();

    @Query(value = "select day(create_time) as day,count(1) as number " +
            "FROM address where create_time BETWEEN DATE_SUB(now(),interval 7 day) and now() \n" +
            "and type = 22 GROUP BY day(create_time)",nativeQuery = true)
    List<Map<String,Object>> findAweekDeliver();

    @Query(value = "select day(create_time) as day,count(1) as number " +
            "FROM address where create_time BETWEEN DATE_SUB(now(),interval 7 day) and now() \n" +
            "and type in (19,29) GROUP BY day(create_time)",nativeQuery = true)
    List<Map<String,Object>> findAweekFault();


}
