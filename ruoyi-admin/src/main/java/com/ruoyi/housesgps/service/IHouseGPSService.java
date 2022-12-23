package com.ruoyi.housesgps.service;

import java.util.List;
import com.ruoyi.housesgps.domain.HouseGPS;

/**
 * 地图管理Service接口
 * 
 * @author yyt
 * @date 2022-12-11
 */
public interface IHouseGPSService 
{
    /**
     * 查询地图管理
     * 
     * @param id 地图管理主键
     * @return 地图管理
     */
    public HouseGPS selectHouseGPSById(Long id);

    /**
     * 查询地图管理列表
     * 
     * @param houseGPS 地图管理
     * @return 地图管理集合
     */
    public List<HouseGPS> selectHouseGPSList(HouseGPS houseGPS);

    /**
     * 新增地图管理
     * 
     * @param houseGPS 地图管理
     * @return 结果
     */
    public int insertHouseGPS(HouseGPS houseGPS);

    /**
     * 修改地图管理
     * 
     * @param houseGPS 地图管理
     * @return 结果
     */
    public int updateHouseGPS(HouseGPS houseGPS);

    /**
     * 批量删除地图管理
     * 
     * @param ids 需要删除的地图管理主键集合
     * @return 结果
     */
    public int deleteHouseGPSByIds(String ids);

    /**
     * 删除地图管理信息
     * 
     * @param id 地图管理主键
     * @return 结果
     */
    public int deleteHouseGPSById(Long id);
}
