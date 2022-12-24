package com.ruoyi.web.system.service;

import java.util.List;
import com.ruoyi.web.system.domain.HouseSpecialty;

/**
 * 我的特产Service接口
 *
 * @author pch
 * @date 2022-12-13
 */
public interface IHouseSpecialtyService
{
    /**
     * 查询我的特产
     *
     * @param id 我的特产主键
     * @return 我的特产
     */
    public HouseSpecialty selectHouseSpecialtyById(Long id);

    /**
     * 查询我的特产列表
     *
     * @param houseSpecialty 我的特产
     * @return 我的特产集合
     */
    public List<HouseSpecialty> selectHouseSpecialtyList(HouseSpecialty houseSpecialty);

    /**
     * 新增我的特产
     *
     * @param houseSpecialty 我的特产
     * @return 结果
     */
    public int insertHouseSpecialty(HouseSpecialty houseSpecialty);

    /**
     * 修改我的特产
     *
     * @param houseSpecialty 我的特产
     * @return 结果
     */
    public int updateHouseSpecialty(HouseSpecialty houseSpecialty);

    /**
     * 批量删除我的特产
     *
     * @param ids 需要删除的我的特产主键集合
     * @return 结果
     */
    public int deleteHouseSpecialtyByIds(String ids);

    /**
     * 删除我的特产信息
     *
     * @param id 我的特产主键
     * @return 结果
     */
    public int deleteHouseSpecialtyById(Long id);

    public String getHouseNameById(Long id);

    public List<String> getName();

    public Long getSellNumber(String name);

    public Long getSoldNumber(String name);

    public String getHouseIdByHouseName(HouseSpecialty houseSpecialty);
}
