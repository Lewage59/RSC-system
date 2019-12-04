package com.rsc.dataobject.mapper;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "work_condition")
@Data
public class workCondition {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "workday")
    private Integer workday;

    @Column(name = "leaveday")
    private Integer leaveday;

    @Column(name = "overtimeday")
    private Integer overtimeday;

    @Column(name = "date")
    private Date date;

    @Column(name = "receipt")
    private Integer receipt;

    @Column(name = "deliver")
    private Integer deliver;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Postman.class)
    @JoinColumn(name="postmanId",referencedColumnName = "id")
    private Postman postmans;


}
