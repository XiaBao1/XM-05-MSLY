package com.ruoyi.web.system.domain;

import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 特产订购对象 house_specialty
 * 
 * @author pch
 * @date 2022-12-14
 */
public class BuySpecialty extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 民宿ID */
    @Excel(name = "民宿ID")
    private Long houseId;

    @Excel(name = "民宿名称")
    private String houseName;

    /** 特产名称 */
    @Excel(name = "特产名称")
    private String specialtyName;

    /** 特产描述 */
    @Excel(name = "特产描述")
    private String description;

    /** 特产单价 */
    @Excel(name = "特产单价")
    private Long price;

    /** 库存量 */
    @Excel(name = "库存量")
    private Long inventory;

    /** 特产链接 */
    @Excel(name = "特产链接")
    private String imageUrl;

    public  Long userId= (Long) PermissionUtils.getPrincipalProperty("userId");

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setHouseId(Long houseId) 
    {
        this.houseId = houseId;
    }

    public Long getHouseId() 
    {
        return houseId;
    }
    public void setSpecialtyName(String specialtyName) 
    {
        this.specialtyName = specialtyName;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public String getSpecialtyName()
    {
        return specialtyName;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setPrice(Long price) 
    {
        this.price = price;
    }

    public Long getPrice() 
    {
        return price;
    }
    public void setInventory(Long inventory) 
    {
        this.inventory = inventory;
    }

    public Long getInventory() 
    {
        return inventory;
    }
    public void setImageUrl(String imageUrl) 
    {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() 
    {
        return imageUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("houseId", getHouseId())
            .append("houseName",getHouseName())
            .append("specialtyName", getSpecialtyName())
            .append("description", getDescription())
            .append("price", getPrice())
            .append("inventory", getInventory())
            .append("imageUrl", getImageUrl())
            .toString();
    }
}
