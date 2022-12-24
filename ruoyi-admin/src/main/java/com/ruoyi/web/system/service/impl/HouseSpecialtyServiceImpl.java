package com.ruoyi.web.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.system.mapper.HouseSpecialtyMapper;
import com.ruoyi.web.system.domain.HouseSpecialty;
import com.ruoyi.web.system.service.IHouseSpecialtyService;
import com.ruoyi.common.core.text.Convert;

/**
 * 我的特产Service业务层处理
 *
 * @author pch
 * @date 2022-12-13
 */
@Service
public class HouseSpecialtyServiceImpl implements IHouseSpecialtyService
{
    @Autowired
    private HouseSpecialtyMapper houseSpecialtyMapper;

    /**
     * 查询我的特产
     *
     * @param id 我的特产主键
     * @return 我的特产
     */
    @Override
    public HouseSpecialty selectHouseSpecialtyById(Long id)
    {
        return houseSpecialtyMapper.selectHouseSpecialtyById(id);
    }

    /**
     * 查询我的特产列表
     *
     * @param houseSpecialty 我的特产
     * @return 我的特产
     */
    @Override
    public List<HouseSpecialty> selectHouseSpecialtyList(HouseSpecialty houseSpecialty)
    {
        return houseSpecialtyMapper.selectHouseSpecialtyList(houseSpecialty);
    }

    /**
     * 新增我的特产
     *
     * @param houseSpecialty 我的特产
     * @return 结果
     */
    @Override
    public int insertHouseSpecialty(HouseSpecialty houseSpecialty)
    {
        return houseSpecialtyMapper.insertHouseSpecialty(houseSpecialty);
    }

    /**
     * 修改我的特产
     *
     * @param houseSpecialty 我的特产
     * @return 结果
     */
    @Override
    public int updateHouseSpecialty(HouseSpecialty houseSpecialty)
    {
        return houseSpecialtyMapper.updateHouseSpecialty(houseSpecialty);
    }

    /**
     * 批量删除我的特产
     *
     * @param ids 需要删除的我的特产主键
     * @return 结果
     */
    @Override
    public int deleteHouseSpecialtyByIds(String ids)
    {
        return houseSpecialtyMapper.deleteHouseSpecialtyByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除我的特产信息
     *
     * @param id 我的特产主键
     * @return 结果
     */
    @Override
    public int deleteHouseSpecialtyById(Long id)
    {
        return houseSpecialtyMapper.deleteHouseSpecialtyById(id);
    }

    public String getHouseNameById(Long id){
        return houseSpecialtyMapper.getHouseNameById(id);
    }

    public List<String> getName(){
        HouseSpecialty hh=new HouseSpecialty();
        return houseSpecialtyMapper.getName(hh.userId);
    }

    public Long getSellNumber(String name){
        HouseSpecialty hh=new HouseSpecialty();
        hh.setSpecialtyName(name);
        return houseSpecialtyMapper.getSellNumber(hh);
    }

    public Long getSoldNumber(String name){
        HouseSpecialty hh=new HouseSpecialty();
        hh.setSpecialtyName(name);
        return houseSpecialtyMapper.getSoldNumber(hh);
    }

    public String getHouseIdByHouseName(HouseSpecialty houseSpecialty){
        return houseSpecialtyMapper.getHouseIdByHouseName(houseSpecialty);
    }
}
