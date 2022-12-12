package com.ruoyi.yk.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

public class TopHouseSpecialty {
    private static final long serialVersionUID = 1L;

    /** 特产ID */
    private long id;

    @Excel(name = "民宿名称")
    private String houseName;

    @Excel(name = "民宿地址")
    private String address;

    /** 特产名称 */
    @Excel(name = "特产名")
    private String specialtyName;

    /** 价格 */
    @Excel(name = "价格")
    private double price;

    /** 库存 */
    @Excel(name = "库存")
    private int inventory;

    /** 民宿id */
    @Excel(name = "民宿id")
    private long houseId;

    /** 民宿 */
    @Excel(name = "销量")
    private long sale;

    @Excel(name = "描述")
    private String description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getSale() {
        return sale;
    }

    public void setSale(long sale) {
        this.sale = sale;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public long getHouseId() {
        return houseId;
    }

    public void setHouseId(long houseId) {
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
