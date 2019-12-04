package com.rsc.dataobject.mapper;
/**
 * 地址
 */

import com.rsc.enums.ExpressEnum;
import lombok.Data;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "address")
@DynamicUpdate
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "real_name")
    private String realName;

    @Column(name = "tel")
    private String tel;

    @Column(name = "town")
    private String town;

    @Column(name = "city")
    private String city;

    @Column(name = "area")
    private String area;

    @Column(name = "resAddress")
    private String resAddress;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "finally_time")
    private Date finallyTime;

    @Column(name = "type")
    private Integer type = ExpressEnum.RECEIPT_PREPARE.getCode();

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Users.class)
    @JoinColumn(name="userId",referencedColumnName = "id")
    private Users users;

    @ManyToOne(fetch = FetchType.LAZY,targetEntity = Postman.class)
    @JoinColumn(name="postmanId",referencedColumnName = "id")
    private Postman Apostman;

    @Transient
    private Integer Ptype;

    @Transient
    private Integer no;
}
