package com.ruoyi.landlordhomeorder.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.landlordhomeorder.mapper.LandlordRoomRecordMapper;
import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;
import com.ruoyi.landlordhomeorder.service.ILandlordRoomRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 民宿订单Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-07
 */
@Service
public class LandlordRoomRecordServiceImpl implements ILandlordRoomRecordService 
{
    @Autowired
    private LandlordRoomRecordMapper landlordRoomRecordMapper;

    /**
     * 查询民宿订单
     * 
     * @param id 民宿订单主键
     * @return 民宿订单
     */
    @Override
    public LandlordRoomRecord selectLandlordRoomRecordById(Long id)
    {
        return landlordRoomRecordMapper.selectLandlordRoomRecordById(id);
    }

    /**
     * 查询民宿订单列表
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 民宿订单
     */
    @Override
    public List<LandlordRoomRecord> selectLandlordRoomRecordList(LandlordRoomRecord landlordRoomRecord)
    {
        return landlordRoomRecordMapper.selectLandlordRoomRecordList(landlordRoomRecord);
    }

    /**
     * 新增民宿订单
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 结果
     */
    @Override
    public int insertLandlordRoomRecord(LandlordRoomRecord landlordRoomRecord)
    {
        return landlordRoomRecordMapper.insertLandlordRoomRecord(landlordRoomRecord);
    }

    /**
     * 修改民宿订单
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 结果
     */
    @Override
    public int updateLandlordRoomRecord(LandlordRoomRecord landlordRoomRecord)
    {
        return landlordRoomRecordMapper.updateLandlordRoomRecord(landlordRoomRecord);
    }

    /**
     * 批量删除民宿订单
     * 
     * @param ids 需要删除的民宿订单主键
     * @return 结果
     */
    @Override
    public int deleteLandlordRoomRecordByIds(String ids)
    {
        return landlordRoomRecordMapper.deleteLandlordRoomRecordByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除民宿订单信息
     * 
     * @param id 民宿订单主键
     * @return 结果
     */
    @Override
    public int deleteLandlordRoomRecordById(Long id)
    {
        return landlordRoomRecordMapper.deleteLandlordRoomRecordById(id);
    }
}
