package com.ruoyi.web.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.system.mapper.BuySpecialtyMapper;
import com.ruoyi.web.system.domain.BuySpecialty;
import com.ruoyi.web.system.service.IBuySpecialtyService;
import com.ruoyi.common.core.text.Convert;

/**
 * 特产订购Service业务层处理
 *
 * @author pch
 * @date 2022-12-14
 */
@Service
public class BuySpecialtyServiceImpl implements IBuySpecialtyService
{
    @Autowired
    private BuySpecialtyMapper buySpecialtyMapper;

    /**
     * 查询特产订购
     *
     * @param id 特产订购主键
     * @return 特产订购
     */
    @Override
    public BuySpecialty selectBuySpecialtyById(Long id)
    {
        return buySpecialtyMapper.selectBuySpecialtyById(id);
    }

    /**
     * 查询特产订购列表
     *
     * @param buySpecialty 特产订购
     * @return 特产订购
     */
    @Override
    public List<BuySpecialty> selectBuySpecialtyList(BuySpecialty buySpecialty)
    {
        return buySpecialtyMapper.selectBuySpecialtyList(buySpecialty);
    }

    /**
     * 新增特产订购
     *
     * @param buySpecialty 特产订购
     * @return 结果
     */
    @Override
    public int insertBuySpecialty(BuySpecialty buySpecialty)
    {
        return buySpecialtyMapper.insertBuySpecialty(buySpecialty);
    }

    /**
     * 修改特产订购
     *
     * @param buySpecialty 特产订购
     * @return 结果
     */
    @Override
    public int updateBuySpecialty(BuySpecialty buySpecialty)
    {
        return buySpecialtyMapper.updateBuySpecialty(buySpecialty);
    }

    /**
     * 批量删除特产订购
     *
     * @param ids 需要删除的特产订购主键
     * @return 结果
     */
    @Override
    public int deleteBuySpecialtyByIds(String ids)
    {
        return buySpecialtyMapper.deleteBuySpecialtyByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除特产订购信息
     *
     * @param id 特产订购主键
     * @return 结果
     */
    @Override
    public int deleteBuySpecialtyById(Long id)
    {
        return buySpecialtyMapper.deleteBuySpecialtyById(id);
    }

    public String getHouseNameById(Long id){
        return buySpecialtyMapper.getHouseNameById(id);
    }

    public List<String> getName(){
        return buySpecialtyMapper.getName();
    }

    public Long getSellNumber(String name){
        return buySpecialtyMapper.getSellNumber(name);
    }

    public String getPhoneById(Long id){
        return buySpecialtyMapper.getPhoneById(id);
    }

    public String getMailboxById(Long id){
        return buySpecialtyMapper.getMailboxById(id);
    }

    public List<Long> getRecordId(Long id){
        return buySpecialtyMapper.getRecordId(id);
    }

    public String getUserName(Long id){
        return buySpecialtyMapper.getUserName(id);
    }

    public String getUserComment(Long id){
        return buySpecialtyMapper.getUserComment(id);
    }

    public List<Double> getScore(Long id){
        return buySpecialtyMapper.getScore(id);
    }

    public Long getMoneyById(Long id){
        return buySpecialtyMapper.getMoneyById(id);
    }

    public void updateInventory(BuySpecialty buySpecialty){
        buySpecialtyMapper.updateInventory(buySpecialty);
    }

    public void updateMoney(BuySpecialty buySpecialty){
        buySpecialtyMapper.updateMoney(buySpecialty);
    }

    public void insertRecord(BuySpecialty buySpecialty){
        buySpecialtyMapper.insertRecord(buySpecialty);
    }

    public String getHouseIdByHouseName(String houseName){
        return  buySpecialtyMapper.getHouseIdByHouseName(houseName);
    }
}
