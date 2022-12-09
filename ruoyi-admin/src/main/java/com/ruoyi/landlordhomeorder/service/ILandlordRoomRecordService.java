package com.ruoyi.landlordhomeorder.service;

import java.util.List;
import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;

/**
 * 民宿订单Service接口
 * 
 * @author ruoyi
 * @date 2022-12-07
 */
public interface ILandlordRoomRecordService 
{
    /**
     * 查询民宿订单
     * 
     * @param id 民宿订单主键
     * @return 民宿订单
     */
    public LandlordRoomRecord selectLandlordRoomRecordById(Long id);

    /**
     * 查询民宿订单列表
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 民宿订单集合
     */
    public List<LandlordRoomRecord> selectLandlordRoomRecordList(LandlordRoomRecord landlordRoomRecord);

    /**
     * 新增民宿订单
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 结果
     */
    public int insertLandlordRoomRecord(LandlordRoomRecord landlordRoomRecord);

    /**
     * 修改民宿订单
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 结果
     */
    public int updateLandlordRoomRecord(LandlordRoomRecord landlordRoomRecord);

    /**
     * 批量删除民宿订单
     * 
     * @param ids 需要删除的民宿订单主键集合
     * @return 结果
     */
    public int deleteLandlordRoomRecordByIds(String ids);

    public List<Integer> getMonthlyClientRoomRecordIncrement();

    /**
     * 删除民宿订单信息
     * 
     * @param id 民宿订单主键
     * @return 结果
     */
    public int deleteLandlordRoomRecordById(Long id);
}
