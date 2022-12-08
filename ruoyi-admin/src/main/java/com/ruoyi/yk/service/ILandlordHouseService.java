package com.ruoyi.yk.service;

import java.util.List;
import com.ruoyi.yk.domain.LandlordHouse;

/**
 * 代码生成测试Service接口
 * 
 * @author sja
 * @date 2022-11-30
 */
public interface ILandlordHouseService 
{
    /**
     * 查询代码生成测试
     * 
     * @param id 代码生成测试主键
     * @return 代码生成测试
     */
    public LandlordHouse selectLandlordHouseById(Long id);

    /**
     * 查询代码生成测试列表
     * 
     * @param landlordHouse 代码生成测试
     * @return 代码生成测试集合
     */
    public List<LandlordHouse> selectLandlordHouseList(LandlordHouse landlordHouse);

    /**
     * 新增代码生成测试
     * 
     * @param landlordHouse 代码生成测试
     * @return 结果
     */
    public int insertLandlordHouse(LandlordHouse landlordHouse);

    /**
     * 修改代码生成测试
     * 
     * @param landlordHouse 代码生成测试
     * @return 结果
     */
    public int updateLandlordHouse(LandlordHouse landlordHouse);

    /**
     * 批量删除代码生成测试
     * 
     * @param ids 需要删除的代码生成测试主键集合
     * @return 结果
     */
    public int deleteLandlordHouseByIds(String ids);

    /**
     * 删除代码生成测试信息
     * 
     * @param id 代码生成测试主键
     * @return 结果
     */
    public int deleteLandlordHouseById(Long id);
}
