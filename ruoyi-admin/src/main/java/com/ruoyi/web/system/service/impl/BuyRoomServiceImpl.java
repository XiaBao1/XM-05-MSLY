package com.ruoyi.web.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.web.system.mapper.BuyRoomMapper;
import com.ruoyi.web.system.domain.BuyRoom;
import com.ruoyi.web.system.service.IBuyRoomService;
import com.ruoyi.common.core.text.Convert;

/**
 * 房间订购Service业务层处理
 *
 * @author ruoyi
 * @date 2022-12-02
 */
@Service
public class BuyRoomServiceImpl implements IBuyRoomService
{
    @Autowired
    private BuyRoomMapper buyRoomMapper;

    /**
     * 查询房间订购
     *
     * @param id 房间订购主键
     * @return 房间订购
     */
    @Override
    public BuyRoom selectBuyRoomById(Long id)
    {
        return buyRoomMapper.selectBuyRoomById(id);
    }

    /**
     * 查询房间订购列表
     *
     * @param buyRoom 房间订购
     * @return 房间订购
     */
    @Override
    public List<BuyRoom> selectBuyRoomList(BuyRoom buyRoom)
    {
        return buyRoomMapper.selectBuyRoomList(buyRoom);
    }

    /**
     * 新增房间订购
     *
     * @param buyRoom 房间订购
     * @return 结果
     */
    @Override
    public int insertBuyRoom(BuyRoom buyRoom)
    {
        return buyRoomMapper.insertBuyRoom(buyRoom);
    }

    /**
     * 修改房间订购
     *
     * @param buyRoom 房间订购
     * @return 结果
     */
    @Override
    public int updateBuyRoom(BuyRoom buyRoom)
    {
        return buyRoomMapper.updateBuyRoom(buyRoom);
    }

    /**
     * 批量删除房间订购
     *
     * @param ids 需要删除的房间订购主键
     * @return 结果
     */
    @Override
    public int deleteBuyRoomByIds(String ids)
    {
        return buyRoomMapper.deleteBuyRoomByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除房间订购信息
     *
     * @param id 房间订购主键
     * @return 结果
     */
    @Override
    public int deleteBuyRoomById(Long id)
    {
        return buyRoomMapper.deleteBuyRoomById(id);
    }

    public Long getHostNumber(Long houseId){
        return buyRoomMapper.getHostNumber(houseId);
    }

    public String getPhoneNumber(Long hostNumber){
        return buyRoomMapper.getPhoneNumber(hostNumber);
    }

    public String getMailBox(Long hostNumber){
        return buyRoomMapper.getMailBox(hostNumber);
    }

//    public void pay(Long id){
//        BuyRoom bb=new BuyRoom();
//        bb.setId(id);
//        bb.setPricePerDay(buyRoomMapper.getPricePerDayById(id));
//        System.out.println("运行到iml，id="+bb.getId());
//        buyRoomMapper.pay1(bb);
//        buyRoomMapper.pay2(bb);
//    }

    public String getHouseNameById(Long id) {
        return buyRoomMapper.getHouseNameById(id);
    }

    public List<Long> getRecordId(Long id){
        return buyRoomMapper.getRecordId(id);
    }

    public String getUserName(Long id){
        return buyRoomMapper.getUserName(id);
    }

    public String getUserComment(Long id){
        return buyRoomMapper.getUserComment(id);
    }

    public List<Double> getScore(Long id){
        return buyRoomMapper.getScore(id);
    }

    public Long getMoney(Long id){
        return buyRoomMapper.getMoney(id);
    }

    public Long getPriceById(Long id){
        return buyRoomMapper.getPricePerDayById(id);
    }

    public  Integer getIsFreeById(Long id){
        return buyRoomMapper.getIsFreeById(id);
    }

    public void setIsFreeById(Long id){
        buyRoomMapper.setIsFreeById(id);
    }

    public void updateMoney(Long money){
        BuyRoom bb=new BuyRoom();
        bb.setPricePerDay(money);//借用
        buyRoomMapper.updateMoney(bb);
    }

    public void insertRecord(BuyRoom buyRoom){
        buyRoomMapper.insertRecord(buyRoom);
    }

    public String getImageUrlById(Long id){
        return buyRoomMapper.getImageUrlById(id);
    }

    public List<String> getName(){
        return buyRoomMapper.getName();
    }

    public Long getSellNumber(String name){
        return buyRoomMapper.getSellNumber(name);
    }

    public List<String> getHouseIdByHouseName(String houseName){
        return buyRoomMapper.getHouseIdByHouseName(houseName);
    }
}
