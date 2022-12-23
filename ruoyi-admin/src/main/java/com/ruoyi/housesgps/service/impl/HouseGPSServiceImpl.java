package com.ruoyi.housesgps.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.housesgps.mapper.HouseGPSMapper;
import com.ruoyi.housesgps.domain.HouseGPS;
import com.ruoyi.housesgps.service.IHouseGPSService;
import com.ruoyi.common.core.text.Convert;

/**
 * 地图管理Service业务层处理
 * 
 * @author yyt
 * @date 2022-12-11
 */
@Service
public class HouseGPSServiceImpl implements IHouseGPSService 
{
    @Autowired
    private HouseGPSMapper houseGPSMapper;

    /**
     * 查询地图管理
     * 
     * @param id 地图管理主键
     * @return 地图管理
     */
    @Override
    public HouseGPS selectHouseGPSById(Long id)
    {
        return houseGPSMapper.selectHouseGPSById(id);
    }

    /**
     * 查询地图管理列表
     * 
     * @param houseGPS 地图管理
     * @return 地图管理
     */
    @Override
    public List<HouseGPS> selectHouseGPSList(HouseGPS houseGPS)
    {
        return houseGPSMapper.selectHouseGPSList(houseGPS);
    }

    /**
     * 新增地图管理
     * 
     * @param houseGPS 地图管理
     * @return 结果
     */
    @Override
    public int insertHouseGPS(HouseGPS houseGPS)
    {
        return houseGPSMapper.insertHouseGPS(houseGPS);
    }

    /**
     * 修改地图管理
     * 
     * @param houseGPS 地图管理
     * @return 结果
     */
    @Override
    public int updateHouseGPS(HouseGPS houseGPS)
    {
        return houseGPSMapper.updateHouseGPS(houseGPS);
    }

    /**
     * 批量删除地图管理
     * 
     * @param ids 需要删除的地图管理主键
     * @return 结果
     */
    @Override
    public int deleteHouseGPSByIds(String ids)
    {
        return houseGPSMapper.deleteHouseGPSByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除地图管理信息
     * 
     * @param id 地图管理主键
     * @return 结果
     */
    @Override
    public int deleteHouseGPSById(Long id)
    {
        return houseGPSMapper.deleteHouseGPSById(id);
    }
}
