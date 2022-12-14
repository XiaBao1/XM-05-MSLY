package com.ruoyi.web.system.mapper;

import java.util.List;
import com.ruoyi.web.system.domain.BuySpecialty;

/**
 * 特产订购Mapper接口
 * 
 * @author pch
 * @date 2022-12-14
 */
public interface BuySpecialtyMapper 
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
     * 删除特产订购
     * 
     * @param id 特产订购主键
     * @return 结果
     */
    public int deleteBuySpecialtyById(Long id);

    /**
     * 批量删除特产订购
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBuySpecialtyByIds(String[] ids);

    String getHouseNameById(Long id);

    public List<String> getName();

    public Long getSellNumber(String name);

    String getPhoneById(Long id);

    String getMailboxById(Long id);

    public  List<Long> getRecordId(Long id);

    public String getUserName(Long id);

    public String getUserComment(Long id);

    public List<Double> getScore(Long id);
}
