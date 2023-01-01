package com.ruoyi.landlordspecialtyorder.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 client_specialty_record
 * 
 * @author ruoyi
 * @date 2022-12-08
 */
public class LandlordSpecialtyRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单ID */
    public Long id;

    /** 顾客ID */
    @Excel(name = "顾客ID")
    private Long clientNumber;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 特产名 */
    @Excel(name = "特产名")
    private String specialtyName;

    /** 民宿 */
    @Excel(name = "民宿")
    private String houseName;

    /** 用户名 */
    @Excel(name = "顾客登录名")
    private String clientName;

    /** 特产订单ID */
    @Excel(name = "特产订单ID")
   public Long specialtyRecordId;

    /** 特产得分 */
    @Excel(name = "得分")
    public BigDecimal score;

    /** 特产评价 */
    @Excel(name = "评价")
    public String comment;

    /** 特产照片 */
    @Excel(name = "照片")
    public String photo;

    @Excel(name = "照片地址")
    private String path;

    /** 特产ID */
    @Excel(name = "特产ID")
    public Long specialtyId;

    /** 订货量 */
    @Excel(name = "订货量")
    private Long quantity;

    /** 订单价格 */
    @Excel(name = "订单价格")
    public Long price;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderTime;

    /** 订单完成时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "订单完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date finishTime;

    /** 是否收获 */
    @Excel(name = "是否收货", readConverterExp = "0=未收货,1=已收货")
    private Integer isReceived;

    /** 是否付款 */
    @Excel(name = "是否付款", readConverterExp = "0=未付款,1=已付款")
    private Integer isPaid;

    /** 订单是否完成 */
    @Excel(name = "订单是否完成", readConverterExp = "0=未完成,1=已完成")
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

    public String getUserName() {
        String userName = (String) PermissionUtils.getPrincipalProperty("userName");
        return userName;
    }

    public void setSpecialtyName(String specialtyName){this.specialtyName=specialtyName;}
    public String getSpecialtyName(){return specialtyName;}

    public void setHouseName(String houseName){this.houseName=houseName;}
    public String getHouseName(){return houseName;}

    public void setClientName(String clientName)
    {
        this.clientName = clientName;
    }

    public String getClientName()
    {
        return clientName;
    }

    public void setspecialtyRecordId(Long specialtyRecordId){this.specialtyRecordId=specialtyRecordId;}
    public Long getspecialtyRecordId(){return specialtyRecordId;}

    public void setScore(BigDecimal score){this.score=score;}
    public BigDecimal getscore(){return score;}

    public void setComment(String comment){this.comment=comment;}
    public String getcomment(){return comment;}

    public void setPhoto(String photo){this.photo=photo;}
    public String getPhoto(){return photo;}

    public void setPath(String path){this.path=path;}
    public String getPath(){return path;}

    public void setSpecialtyId(Long specialtyId) 
    {
        this.specialtyId = specialtyId;
    }

    public Long getSpecialtyId() 
    {
        return specialtyId;
    }
    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }
    public void setPrice(Long price) 
    {
        this.price = price;
    }

    public Long getPrice() 
    {
        return price;
    }
    public void setOrderTime(Date orderTime) 
    {
        this.orderTime = orderTime;
    }

    public Date getOrderTime() 
    {
        return orderTime;
    }
    public void setFinishTime(Date finishTime) 
    {
        this.finishTime = finishTime;
    }

    public Date getFinishTime() 
    {
        return finishTime;
    }
    public void setIsReceived(Integer isReceived) 
    {
        this.isReceived = isReceived;
    }

    public Integer getIsReceived() 
    {
        return isReceived;
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
             .append("clientName",getClientName())
                .append("specialtyName",getSpecialtyName())
                .append("houseName",getHouseName())
            .append("specialtyId", getSpecialtyId())
            .append("quantity", getQuantity())
            .append("price", getPrice())
            .append("orderTime", getOrderTime())
            .append("finishTime", getFinishTime())
            .append("isReceived", getIsReceived())
            .append("isPaid", getIsPaid())
            .append("isDone", getIsDone())
                .append("specialtyRecordId",getspecialtyRecordId())
                .append("score",getscore())
                .append("comment",getcomment())
                .append("photo",getPhoto())
                .append("path",getPath())
            .toString();
    }
}