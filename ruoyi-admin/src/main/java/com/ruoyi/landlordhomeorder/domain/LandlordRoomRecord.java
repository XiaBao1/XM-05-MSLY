package com.ruoyi.landlordhomeorder.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 民宿订单对象 client_room_record
 * 
 * @author ruoyi
 * @date 2022-12-07
 */
public class LandlordRoomRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    private Long id;

    /** 顾客账号 */
    @Excel(name = "顾客账号")
    private Long clientNumber;

//    /** 顾客账号 */
//    @Excel(name = "顾客账号")
//    private Long clientNumber;

    /** 房间ID */
    @Excel(name = "房间ID")
    private Long roomId;

    /** 预计入住时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计入住时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkInDate;

    /** 预计退房时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计退房时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkOutDate;

    /** 实际入住时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际入住时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reserveInDate;

    /** 实际退房时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际退房时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reserveOutDate;

    /** 价格 */
    @Excel(name = "价格")
    private Long price;

    /** 已付款 */
    @Excel(name = "已付款")
    private Integer isPaid;

    /** 已完成 */
    @Excel(name = "已完成")
    private Integer isDone;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setClientNumber(Long clientNumber) 
    {
        this.clientNumber = clientNumber;
    }

    public Long getClientNumber() 
    {
        return clientNumber;
    }
    public void setRoomId(Long roomId) 
    {
        this.roomId = roomId;
    }

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setCheckInDate(Date checkInDate) 
    {
        this.checkInDate = checkInDate;
    }

    public Date getCheckInDate() 
    {
        return checkInDate;
    }
    public void setCheckOutDate(Date checkOutDate) 
    {
        this.checkOutDate = checkOutDate;
    }

    public Date getCheckOutDate() 
    {
        return checkOutDate;
    }
    public void setReserveInDate(Date reserveInDate) 
    {
        this.reserveInDate = reserveInDate;
    }

    public Date getReserveInDate() 
    {
        return reserveInDate;
    }
    public void setReserveOutDate(Date reserveOutDate) 
    {
        this.reserveOutDate = reserveOutDate;
    }

    public Date getReserveOutDate() 
    {
        return reserveOutDate;
    }
    public void setPrice(Long price) 
    {
        this.price = price;
    }

    public Long getPrice() 
    {
        return price;
    }
    public void setIsPaid(Integer isPaid) 
    {
        this.isPaid = isPaid;
    }

    public Integer getIsPaid() 
    {
        return isPaid;
    }
    public void setIsDone(Integer isDone) 
    {
        this.isDone = isDone;
    }

    public Integer getIsDone() 
    {
        return isDone;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("clientNumber", getClientNumber())
            .append("roomId", getRoomId())
            .append("checkInDate", getCheckInDate())
            .append("checkOutDate", getCheckOutDate())
            .append("reserveInDate", getReserveInDate())
            .append("reserveOutDate", getReserveOutDate())
            .append("price", getPrice())
            .append("isPaid", getIsPaid())
            .append("isDone", getIsDone())
            .toString();
    }
}
