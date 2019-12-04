package com.rsc.View;

import com.rsc.dataobject.mapper.Postman;
import lombok.Data;

import java.util.Date;

@Data
public class workConditionView {

    private Integer id;

    private Integer workday;

    private Integer leaveday;

    private Integer overtimeday;

    private Date date;

    private Integer receipt;

    private Integer deliver;

    private Postman postmans;

    private String ename;


}
