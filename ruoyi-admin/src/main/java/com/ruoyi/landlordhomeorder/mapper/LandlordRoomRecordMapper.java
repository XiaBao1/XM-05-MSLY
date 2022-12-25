package com.ruoyi.landlordhomeorder.mapper;

import java.util.List;

import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;

/**
 * 民宿订单Mapper接口
 * 
 * @author ruoyi
 * @date 2022-12-07
 */
public interface LandlordRoomRecordMapper 
{
    /**
     * 查询民宿订单
     * 
     * @param id 民宿订单主键
     * @return 民宿订单
     */
    public LandlordRoomRecord selectLandlordRoomRecordById(Long id);
    public LandlordRoomRecord selectLandlordRoomCommentRecordById(Long id);
    public LandlordRoomRecord selectRoomID(LandlordRoomRecord landlordRoomRecord);

    /**
     * 查询民宿订单列表
     * 
     * @param landlordRoomRecord 民宿订单
     * @return 民宿订单集合
     */
    public List<LandlordRoomRecord> selectLandlordRoomRecordList(LandlordRoomRecord landlordRoomRecord);
    public List<LandlordRoomRecord> selectLandlordRoomRecordList2(LandlordRoomRecord landlordRoomRecord);
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
    public int updateLandlordRoomCommentRecord(LandlordRoomRecord landlordRoomRecord);
    /**
     * 删除民宿订单
     * 
     * @param id 民宿订单主键
     * @return 结果
     */
    public int deleteLandlordRoomRecordById(Long id);

    /**
     * 批量删除民宿订单
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLandlordRoomRecordByIds(String[] ids);
}
