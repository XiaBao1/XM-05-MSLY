package com.ruoyi.web.system.service;

import java.util.List;
import com.ruoyi.web.system.domain.BuySpecialty;

/**
 * 特产订购Service接口
 *
 * @author pch
 * @date 2022-12-14
 */
public interface IBuySpecialtyService
{
    /**
     * 查询特产订购
     *
     * @param id 特产订购主键
     * @return 特产订购
     */
    public BuySpecialty selectBuySpecialtyById(Long id);

    /**
     * 查询特产订购列表
     *
     * @param buySpecialty 特产订购
     * @return 特产订购集合
     */
    public List<BuySpecialty> selectBuySpecialtyList(BuySpecialty buySpecialty);

    /**
     * 新增特产订购
     *
     * @param buySpecialty 特产订购
     * @return 结果
     */
    public int insertBuySpecialty(BuySpecialty buySpecialty);

    /**
     * 修改特产订购
     *
     * @param buySpecialty 特产订购
     * @return 结果
     */
    public int updateBuySpecialty(BuySpecialty buySpecialty);

    /**
     * 批量删除特产订购
     *
     * @param ids 需要删除的特产订购主键集合
     * @return 结果
     */
    public int deleteBuySpecialtyByIds(String ids);

    /**
     * 删除特产订购信息
     *
     * @param id 特产订购主键
     * @return 结果
     */
    public int deleteBuySpecialtyById(Long id);

    public String getHouseNameById(Long id);

    public List<String> getName();

    public Long getSellNumber(String name);

    String getPhoneById(Long id);

    String getMailboxById(Long id);

    public List<Long> getRecordId(Long id);

    public String getUserName(Long id);

    public String getUserComment(Long id);

    public List<Double> getScore(Long id);

    public Long getMoneyById(Long id);

    public void updateInventory(BuySpecialty buySpecialty);

    public void updateMoney(BuySpecialty buySpecialty);

    public void insertRecord(BuySpecialty buySpecialty);

    String getHouseIdByHouseName(String houseName);
}
