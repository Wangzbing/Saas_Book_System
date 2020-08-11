package com.qiusamin.book.saas.domain.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author gutianbo
 */
@Getter
@Setter
public class BizListVO {
    private String vipLevel;
    private String status;
    private String managerPhone;
    private String address;
    private String userAccount;
    private List<UserBizRentList> rentList;
    private List<UserBizSaleList> saleList;
}
