package com.ruoyi.landlordspecialtyorder.service;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.landlordspecialtyorder.domain.LandlordSpecialtyRecord;

/**
 * 订单Service接口
 * 
 * @author ruoyi
 * @date 2022-12-08
 */
public interface ILandlordSpecialtyRecordService 
{
    /**
     * 查询订单
     * 
     * @param id 订单主键
     * @return 订单
     */
    public LandlordSpecialtyRecord selectLandlordSpecialtyRecordById(Long id);
    public LandlordSpecialtyRecord selectLandlordSpecialtyCommentRecordById(Long id);
    public LandlordSpecialtyRecord selectSpecialtyId(LandlordSpecialtyRecord landlordSpecialtyRecord);

    /**
     * 查询订单列表
     * 
     * @param landlordSpecialtyRecord 订单
     * @return 订单集合
     */
    public List<LandlordSpecialtyRecord> selectLandlordSpecialtyRecordList(LandlordSpecialtyRecord landlordSpecialtyRecord);

    /**
     * 新增订单
     * 
     * @param landlordSpecialtyRecord 订单
     * @return 结果
     */
    public int insertLandlordSpecialtyRecord(LandlordSpecialtyRecord landlordSpecialtyRecord);

    /**
     * 修改订单
     * 
     * @param landlordSpecialtyRecord 订单
     * @return 结果
     */
    public int updateLandlordSpecialtyRecord(LandlordSpecialtyRecord landlordSpecialtyRecord);
    public int updateLandlordSpecialtyCommentRecord(LandlordSpecialtyRecord landlordSpecialtyRecord);

    /**
     * 批量删除订单
     * 
     * @param ids 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteLandlordSpecialtyRecordByIds(String ids);

    public List<Integer> getMonthlyLandlordSpecialtyRecordIncrement();

    /**
     * 删除订单信息
     * 
     * @param id 订单主键
     * @return 结果
     */
    public int deleteLandlordSpecialtyRecordById(Long id);

    public int getId(Long roomRecordId);
    public BigDecimal getScore(Long roomRecordId);
    public String getComment(Long roomRecordId);;
    public String getPhoto(Long roomRecordId);

    public List<Long> getDataIdList(Long id);
    public Long getRoomRecordId(Long id);
    public BigDecimal getScore2(Long id);
    public String getComment2(Long id);
    public String getPhoto2(Long id);
}
