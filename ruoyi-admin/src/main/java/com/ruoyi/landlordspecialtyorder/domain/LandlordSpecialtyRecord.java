package com.ruoyi.landlordspecialtyorder.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
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
    private Long id;

    /** 顾客ID */
    @Excel(name = "顾客ID")
    private Long clientNumber;

    /** 特产ID */
    @Excel(name = "特产ID")
    private Long specialtyId;

    /** 订货量 */
    @Excel(name = "订货量")
    private Long quantity;

    /** 订单价格 */
    @Excel(name = "订单价格")
    private Long price;

    /** 下单时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下单时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date orderTime;

    /** 订单完成时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "订单完成时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date finishTime;

    /** 是否收获 */
    @Excel(name = "是否收获")
    private Integer isReceived;

    /** 是否付款 */
    @Excel(name = "是否付款")
    private Integer isPaid;

    /** 订单是否完成 */
    @Excel(name = "订单是否完成")
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
            .append("specialtyId", getSpecialtyId())
            .append("quantity", getQuantity())
            .append("price", getPrice())
            .append("orderTime", getOrderTime())
            .append("finishTime", getFinishTime())
            .append("isReceived", getIsReceived())
            .append("isPaid", getIsPaid())
            .append("isDone", getIsDone())
            .toString();
    }
}
