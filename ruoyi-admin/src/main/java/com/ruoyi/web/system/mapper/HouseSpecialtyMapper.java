package com.ruoyi.web.system.mapper;

import java.util.List;

import com.ruoyi.web.system.domain.HouseRoom;
import com.ruoyi.web.system.domain.HouseSpecialty;

/**
 * 我的特产Mapper接口
 *
 * @author pch
 * @date 2022-12-13
 */
public interface HouseSpecialtyMapper
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
     * 删除我的特产
     *
     * @param id 我的特产主键
     * @return 结果
     */
    public int deleteHouseSpecialtyById(Long id);

    /**
     * 批量删除我的特产
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHouseSpecialtyByIds(String[] ids);

    public String getHouseNameById(Long id);

    public List<String> getName(Long id);

    public Long getSellNumber(HouseSpecialty houseSpecialty);

    public Long getSoldNumber(HouseSpecialty houseSpecialty);

    List<String> getHouseIdByHouseName(HouseSpecialty houseSpecialty);

    List<String> getHouseIdByExactHouseName(HouseSpecialty houseSpecialty);
}
