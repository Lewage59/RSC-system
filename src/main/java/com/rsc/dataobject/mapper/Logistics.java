package com.rsc.dataobject.mapper;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "logistics")
@Data
public class Logistics {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "no")
    private int no;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "saddress_id")
    private int saddressId;

    @Column(name = "gaddress_id")
    private int gaddressId;
}
