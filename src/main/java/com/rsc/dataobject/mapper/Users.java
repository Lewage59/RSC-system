package com.rsc.dataobject.mapper;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Data
public class Users implements Serializable {

    public Users(){super();}

    public Users(String username, String upassword) {
        this.username = username;
        this.upassword = upassword;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "username")
    private String username;

    @Column(name = "upassword")
    private String upassword;

    @Column(name = "email")
    private String email;

    @Column(name = "role")
    private String role;

    @Column(name = "postman_id")
    private Integer postmanId;

    @OneToMany(fetch = FetchType.LAZY,targetEntity = Address.class,mappedBy = "users")
    private Set<Address> address = new HashSet<>();



}
