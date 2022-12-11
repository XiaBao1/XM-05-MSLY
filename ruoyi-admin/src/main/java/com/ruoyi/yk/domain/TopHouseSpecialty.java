package com.ruoyi.yk.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

public class TopHouseSpecialty {
    private static final long serialVersionUID = 1L;

    /** 特产ID */
    private Long id;

    @Excel(name = "民宿名称")
    private String houseName;

    @Excel(name = "民宿地址")
    private String address;

    /** 特产名称 */
    @Excel(name = "特产名")
    private String specialtyName;

    /** 价格 */
    @Excel(name = "价格")
    private Double price;

    /** 库存 */
    @Excel(name = "库存")
    private int inventory;

    /** 民宿id */
    @Excel(name = "民宿id")
    private Long houseId;

    /** 民宿 */
    @Excel(name = "销量")
    private Long sale;

    @Excel(name = "描述")
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getSale() {
        return sale;
    }

    public void setSale(Long sale) {
        this.sale = sale;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public Long getHouseId() {
        return houseId;
    }

    public void setHouseId(Long houseId) {
        this.houseId = houseId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }
}
