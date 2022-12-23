package com.ruoyi.web.system.service;

import java.util.List;
import com.ruoyi.web.system.domain.BuyRoom;

/**
 * 房间订购Service接口
 *
 * @author ruoyi
 * @date 2022-12-02
 */
public interface IBuyRoomService
{
    /**
     * 查询房间订购
     *
     * @param id 房间订购主键
     * @return 房间订购
     */
    public BuyRoom selectBuyRoomById(Long id);

    /**
     * 查询房间订购列表
     *
     * @param buyRoom 房间订购
     * @return 房间订购集合
     */
    public List<BuyRoom> selectBuyRoomList(BuyRoom buyRoom);

    /**
     * 新增房间订购
     *
     * @param buyRoom 房间订购
     * @return 结果
     */
    public int insertBuyRoom(BuyRoom buyRoom);

    /**
     * 修改房间订购
     *
     * @param buyRoom 房间订购
     * @return 结果
     */
    public int updateBuyRoom(BuyRoom buyRoom);

    /**
     * 批量删除房间订购
     *
     * @param ids 需要删除的房间订购主键集合
     * @return 结果
     */
    public int deleteBuyRoomByIds(String ids);

    /**
     * 删除房间订购信息
     *
     * @param id 房间订购主键
     * @return 结果
     */
    public int deleteBuyRoomById(Long id);

    public Long getHostNumber(Long houseId);

    public String getPhoneNumber(Long hostNumber);

    public String getMailBox(Long hostNumber);

//    public void pay(Long id);

    public String getHouseNameById(Long id);

    public List<Long> getRecordId(Long id);

    public String getUserName(Long id);

    public String getUserComment(Long id);

    public List<Double> getScore(Long id);

    public Long getMoney(Long id);

    public Long getPriceById(Long id);

    public  Integer getIsFreeById(Long id);

    public void setIsFreeById(Long id);

    public void updateMoney(Long money);

    public void insertRecord(BuyRoom buyRoom);

    public String getImageUrlById(Long id);

    public List<String> getName();

    public Long getSellNumber(String name);
}
