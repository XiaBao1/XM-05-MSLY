package com.ruoyi.web.system.domain;

import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.shiro.SecurityUtils;

/**
 * 房子管理对象 house_room
 *
 * @author ruoyi
 * @date 2022-12-02
 */
public class HouseRoom extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 民宿ID */
    //@Excel(name = "民宿ID")
    private Long houseId;

    @Excel(name = "民宿名称")
    public String houseName;

    /** 房间号 */
    @Excel(name = "房间号")
    private String roomNumber;

    /** 每日价格 */
    @Excel(name = "每日价格")
    private Long pricePerDay;

    /** 房间标准 */
    @Excel(name = "房间标准")
    private String standard;

    /** 空闲 */
    //@Excel(name = "空闲")
    private Integer isFree;

    @Excel(name = "空闲")
    private String free;

    public  Long userId= (Long) PermissionUtils.getPrincipalProperty("userId");

    //private Long userId= SecurityUtils.getUserId();

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

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public void setRoomNumber(String roomNumber)
    {
        this.roomNumber = roomNumber;
    }

    public String getRoomNumber()
    {
        return roomNumber;
    }
    public void setPricePerDay(Long pricePerDay)
    {
        this.pricePerDay = pricePerDay;
    }

    public Long getPricePerDay()
    {
        return pricePerDay;
    }
    public void setStandard(String standard)
    {
        this.standard = standard;
    }

    public String getStandard()
    {
        return standard;
    }
    public void setIsFree(Integer isFree)
    {
        this.isFree = isFree;
    }

    public Integer getIsFree()
    {
        return isFree;
    }

    public String getFree(){return free;}

    public void setFree(String free){
        this.free=free;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("houseId", getHouseId())
                .append("houseName",getHouseName())
                .append("roomNumber", getRoomNumber())
                .append("pricePerDay", getPricePerDay())
                .append("standard", getStandard())
                .append("isFree", getIsFree())
                .toString();
    }

//    public Integer getUserId(){
//        Integer ans= (Integer) PermissionUtils.getPrincipalProperty("userId");
//        return ans;
//    }
}
