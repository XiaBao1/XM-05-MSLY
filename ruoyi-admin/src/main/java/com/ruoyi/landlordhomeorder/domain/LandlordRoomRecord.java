package com.ruoyi.landlordhomeorder.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.security.PermissionUtils;
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

    /** 用户名 */
    @Excel(name = "顾客名")
    private String clientName;

    /** 用户名 */
    @Excel(name = "顾客名")
    private String loginName;

    /** 特产订单ID */
    @Excel(name = "特产订单ID")
    public Long roomRecordId;

    /** 房间号 */
    @Excel(name = "房间号")
    private Long roomNumber;

    @Excel(name = "民宿名称")
    private String houseName;

    /** 特产得分 */
    @Excel(name = "得分")
    private BigDecimal score;

    /** 特产评价 */
    @Excel(name = "评价")
    private String comment;

    /** 特产照片 */
    @Excel(name = "照片")
    public String photo;

    @Excel(name = "照片地址")
    private String path;

    /** 房间ID */
    @Excel(name = "房间ID")
    public Long roomId;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date buyTime;

    /** 预计入住时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际入住时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkInDate;

    /** 预计退房时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "实际退房时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkOutDate;

    /** 实际入住时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计入住时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reserveInDate;

    /** 实际退房时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "预计退房时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reserveOutDate;

    /** 价格 */
    @Excel(name = "价格")
    private Long price;

    /** 已付款 */
    @Excel(name = "已付款", readConverterExp = "0=未付款,1=已付款")
    private Integer isPaid;

    /** 已完成 */
    @Excel(name = "已完成", readConverterExp = "0=未完成,1=已完成")
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
    public String getUserName() {
        String userName = (String) PermissionUtils.getPrincipalProperty("userName");
        return userName;
    }

    public void setLoginName(String loginName)
{
    this.loginName = loginName;
}

    public String getLoginName()
    {
        return loginName;
    }

    public void setClientName(String clientName)
    {
        this.clientName = clientName;
    }

    public String getClientName()
    {
        return clientName;
    }

    public void setroomRecordId(Long roomRecordId){this.roomRecordId=roomRecordId;}
    public Long getroomRecordId(){return roomRecordId;}

    public void setRoomNumber(Long roomNumber){this.roomNumber=roomNumber;}
    public Long getRoomNumber() {
        return roomNumber;
    }

    public void setHouseName(String houseName){this.houseName=houseName;}
    public String getHouseName(){return houseName;}

    public void setScore(BigDecimal score){this.score=score;}
    public BigDecimal getscore(){return score;}

    public void setComment(String comment){this.comment=comment;}
    public String getcomment(){return comment;}

    public void setPhoto(String photo){this.photo=photo;}
    public String getPhoto(){return photo;}

    public void setPath(String path){this.path=path;}
    public String getPath(){return path;}

    public Long getRoomId() 
    {
        return roomId;
    }
    public void setCheckInDate(Date checkInDate) 
    {
        this.checkInDate = checkInDate;
    }

    public void setBuyTime(Date buyTime)
    {
        this.buyTime = buyTime;
    }
    public Date getBuyTime()
    {
        return buyTime;
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
            .append("userName",getUserName())
            .append("loginName",getLoginName())
            .append("clientName",getClientName())
            .append("roomId", getRoomId())
             .append("buyTime",getBuyTime())
            .append("checkInDate", getCheckInDate())
            .append("checkOutDate", getCheckOutDate())
            .append("reserveInDate", getReserveInDate())
            .append("reserveOutDate", getReserveOutDate())
            .append("price", getPrice())
            .append("isPaid", getIsPaid())
            .append("isDone", getIsDone())
            .append("roomRecordId",getroomRecordId())
            .append("score",getscore())
             .append("comment",getcomment())
             .append("photo",getPhoto())
             .append("path",getPath())
             .append("roomNumber",getRoomNumber())
             .append("houseName", getHouseName())
            .toString();
    }
}
