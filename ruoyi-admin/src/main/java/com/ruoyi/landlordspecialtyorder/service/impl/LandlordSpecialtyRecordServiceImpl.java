package com.ruoyi.landlordspecialtyorder.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.ruoyi.landlordhomeorder.domain.LandlordRoomRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.landlordspecialtyorder.mapper.LandlordSpecialtyRecordMapper;
import com.ruoyi.landlordspecialtyorder.domain.LandlordSpecialtyRecord;
import com.ruoyi.landlordspecialtyorder.service.ILandlordSpecialtyRecordService;
import com.ruoyi.common.core.text.Convert;

/**
 * 订单Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-12-08
 */
@Service
public class LandlordSpecialtyRecordServiceImpl implements ILandlordSpecialtyRecordService 
{
    @Autowired
    private LandlordSpecialtyRecordMapper landlordSpecialtyRecordMapper;

    /**
     * 查询订单
     * 
     * @param id 订单主键
     * @return 订单
     */
    @Override
    public LandlordSpecialtyRecord selectLandlordSpecialtyRecordById(Long id)
    {
        return landlordSpecialtyRecordMapper.selectLandlordSpecialtyRecordById(id);
    }

    /**
     * 查询订单列表
     * 
     * @param landlordSpecialtyRecord 订单
     * @return 订单
     */
    @Override
    public List<LandlordSpecialtyRecord> selectLandlordSpecialtyRecordList(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        return landlordSpecialtyRecordMapper.selectLandlordSpecialtyRecordList(landlordSpecialtyRecord);
    }

    /**
     * 新增订单
     * 
     * @param landlordSpecialtyRecord 订单
     * @return 结果
     */
    @Override
    public int insertLandlordSpecialtyRecord(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        return landlordSpecialtyRecordMapper.insertLandlordSpecialtyRecord(landlordSpecialtyRecord);
    }

    /**
     * 修改订单
     * 
     * @param landlordSpecialtyRecord 订单
     * @return 结果
     */
    @Override
    public int updateLandlordSpecialtyRecord(LandlordSpecialtyRecord landlordSpecialtyRecord)
    {
        return landlordSpecialtyRecordMapper.updateLandlordSpecialtyRecord(landlordSpecialtyRecord);
    }

    /**
     * 批量删除订单
     * 
     * @param ids 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteLandlordSpecialtyRecordByIds(String ids)
    {
        return landlordSpecialtyRecordMapper.deleteLandlordSpecialtyRecordByIds(Convert.toStrArray(ids));
    }

    @Override
    public List<Integer> getMonthlyLandlordSpecialtyRecordIncrement() {
        int len = 12;
        List<Integer> list = new ArrayList<Integer>(len);
        for (int i = 0; i < len; i++) {
            list.add(0);
        }

        Calendar ca = Calendar.getInstance();
        List<LandlordSpecialtyRecord> clientRoomRecord= landlordSpecialtyRecordMapper.selectLandlordSpecialtyRecordList(new LandlordSpecialtyRecord());
        for (LandlordSpecialtyRecord user : clientRoomRecord) {
            if ( !"1".equals(user.getIsDone()) ) {
                ca.setTime(user.getFinishTime());
                int idx = ca.get(Calendar.MONTH);
                int cur = list.get(idx);
                list.set(idx, 1 + cur);
            }
        }

        return list;
    }

    /**
     * 删除订单信息
     * 
     * @param id 订单主键
     * @return 结果
     */
    @Override
    public int deleteLandlordSpecialtyRecordById(Long id)
    {
        return landlordSpecialtyRecordMapper.deleteLandlordSpecialtyRecordById(id);
    }


}