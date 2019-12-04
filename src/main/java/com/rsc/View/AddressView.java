package com.rsc.View;

import lombok.Data;

import java.util.Date;


@Data
public class AddressView {

    private Integer id;

    private String realName;

    private String tel;

    private String town;

    private String city;

    private String area;

    private Integer type;

    private String resAddress;

    private Date createTime;

    private Date finallyTime;

    private Integer no;
}
