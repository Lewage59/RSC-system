package com.rsc.dataobject.mapper;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "postman")
@Data
public class Postman {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ename")
    private String ename;

    @Column(name = "epassword")
    private String epassword;

    @Column(name = "etown")
    private String etown;

    @Column(name = "ecity")
    private String ecity;

    @Column(name = "earea")
    private String earea;

    @Column(name = "res_address")
    private String resAddress;

    @Column(name = "etel")
    private String etel;

    @Column(name = "basesalary")
    private Double basesalary;

    @OneToMany(fetch = FetchType.LAZY,targetEntity = workCondition.class,mappedBy = "postmans")
    private Set<workCondition> workCondition = new HashSet<>();

    @OneToMany(fetch = FetchType.LAZY,targetEntity = Address.class,mappedBy = "Apostman")
    private Set<Address> addresses = new HashSet<>();

    @Column(name = "state")
    private Integer state;
}
