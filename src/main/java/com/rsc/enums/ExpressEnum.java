package com.rsc.enums;

import lombok.Getter;

@Getter
public enum ExpressEnum implements CodeEnum{
    RECEIPT_PREPARE(10,"准备收件"),
    RECEIPT_SUCCESS(11,"收件完成"),
    RECEIPT_FAIL(19,"收件失败"),

    PIE_PREPARE(20,"准备派件"),
    PIE_SENDING(21,"正在派件"),
    PIE_SUCCESS(22,"派件成功"),
    PIE_FAIL(29,"派件失败"),
    ;

    Integer code;

    String message;

    ExpressEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
