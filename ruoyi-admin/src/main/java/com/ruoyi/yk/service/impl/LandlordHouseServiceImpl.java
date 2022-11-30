package com.ruoyi.yk.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yk.mapper.LandlordHouseMapper;
import com.ruoyi.yk.domain.LandlordHouse;
import com.ruoyi.yk.service.ILandlordHouseService;
import com.ruoyi.common.core.text.Convert;

/**
 * 代码生成测试Service业务层处理
 * 
 * @author sja
 * @date 2022-11-30
 */
@Service
public class LandlordHouseServiceImpl implements ILandlordHouseService 
{
    @Autowired
    private LandlordHouseMapper landlordHouseMapper;

    /**
     * 查询代码生成测试
     * 
     * @param id 代码生成测试主键
     * @return 代码生成测试
     */
    @Override
    public LandlordHouse selectLandlordHouseById(Long id)
    {
        return landlordHouseMapper.selectLandlordHouseById(id);
    }

    /**
     * 查询代码生成测试列表
     * 
     * @param landlordHouse 代码生成测试
     * @return 代码生成测试
     */
    @Override
    public List<LandlordHouse> selectLandlordHouseList(LandlordHouse landlordHouse)
    {
        return landlordHouseMapper.selectLandlordHouseList(landlordHouse);
    }

    /**
     * 新增代码生成测试
     * 
     * @param landlordHouse 代码生成测试
     * @return 结果
     */
    @Override
    public int insertLandlordHouse(LandlordHouse landlordHouse)
    {
        return landlordHouseMapper.insertLandlordHouse(landlordHouse);
    }

    /**
     * 修改代码生成测试
     * 
     * @param landlordHouse 代码生成测试
     * @return 结果
     */
    @Override
    public int updateLandlordHouse(LandlordHouse landlordHouse)
    {
        return landlordHouseMapper.updateLandlordHouse(landlordHouse);
    }

    /**
     * 批量删除代码生成测试
     * 
     * @param ids 需要删除的代码生成测试主键
     * @return 结果
     */
    @Override
    public int deleteLandlordHouseByIds(String ids)
    {
        return landlordHouseMapper.deleteLandlordHouseByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除代码生成测试信息
     * 
     * @param id 代码生成测试主键
     * @return 结果
     */
    @Override
    public int deleteLandlordHouseById(Long id)
    {
        return landlordHouseMapper.deleteLandlordHouseById(id);
    }
}
