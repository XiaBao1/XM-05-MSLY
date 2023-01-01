package com.ruoyi.web.system.domain;

import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 我的特产对象 house_specialty
 *
 * @author pch
 * @date 2022-12-13
 */
public class HouseSpecialty extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 民宿ID */
    //@Excel(name = "民宿ID")
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

    private Integer priceDown;

    private Integer priceUp;

    private Integer inventoryDown;

    private Integer inventoryUp;

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

    public String getHouseName()
    {
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

    public Integer getPriceDown(){return priceDown;}

    public void setPriceDown(Integer priceDown){
        this.priceDown=priceDown;
    }

    public Integer getPriceUp(){return priceUp;}

    public void setPriceUp(Integer priceUp){
        this.priceUp=priceUp;
    }

    public Integer getInventoryDown(){return inventoryDown;}

    public void setInventoryDown(Integer inventoryDown){
        this.inventoryDown=inventoryDown;
    }

    public Integer getInventoryUp(){return inventoryUp;}

    public void setInventoryUp(Integer inventoryUp){
        this.inventoryUp=inventoryUp;
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
                .append("priceDown", getPriceDown())
                .append("priceUp", getPriceUp())
                .append("inventoryDown", getInventoryDown())
                .append("inventoryUp", getInventoryUp())
                .toString();
    }
}
