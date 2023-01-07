package com.ruoyi.web.system.mapper;

import java.util.List;
import com.ruoyi.web.system.domain.HouseRoom;

/**
 * 房子管理Mapper接口
 *
 * @author ruoyi
 * @date 2022-12-02
 */
public interface HouseRoomMapper
{
    /**
     * 查询房子管理
     *
     * @param id 房子管理主键
     * @return 房子管理
     */
    public HouseRoom selectHouseRoomById(Long id);

    /**
     * 查询房子管理列表
     *
     * @param houseRoom 房子管理
     * @return 房子管理集合
     */
    public List<HouseRoom> selectHouseRoomList(HouseRoom houseRoom);

    /**
     * 新增房子管理
     *
     * @param houseRoom 房子管理
     * @return 结果
     */
    public int insertHouseRoom(HouseRoom houseRoom);

    /**
     * 修改房子管理
     *
     * @param houseRoom 房子管理
     * @return 结果
     */
    public int updateHouseRoom(HouseRoom houseRoom);

    /**
     * 删除房子管理
     *
     * @param id 房子管理主键
     * @return 结果
     */
    public int deleteHouseRoomById(Long id);

    /**
     * 批量删除房子管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHouseRoomByIds(String[] ids);

    public int getAppointNumber(HouseRoom houseRoom);

    public int getUnappointNumber(HouseRoom houseRoom);

    public String getHouseNameById(Long id);

    List<String> getHouseIdByHouseName(HouseRoom houseRoom);

    List<String> getHouseIdByExactHouseName(HouseRoom houseRoom);

    Integer getAllUser();

    Integer getAllHouse();

    Integer getAllSpecialty();

    Integer getAllRoomBill();

    Integer getAllSpecialtyBill();

    Integer getRoomDone(Long userId);

    Integer getRoomUndo(Long userId);

    Integer getSpecialtyDone(Long userId);

    Integer getSpecialtyUndo(Long userId);

    Integer getSpecialtySay(Long userId);

    Integer getRoomSay(Long userId);

    Integer getSpecialtyUnSay(Long userId);

    Integer getRoomUnSay(Long userId);

    Integer getToDoDone(Long userId);

    Integer getToDoUndo(Long userId);

    List<Long> getIdFromRoomRecord();

    String getNameFromRoomRecordById(Long id);

    String getTimeFromRoomRecordById(Long id);

    String getLandlordFromRoomRecordById(Long id);

    String getRoomNumberFromRoomRecordById(Long id);

    List<Long> getIdFromSpecialtyRecord();

    String getNameFromSpecialtyRecordById(Long id);

    String getTimeFromSpecialtyRecordById(Long id);

    String getLandlordFromSpecialtyRecordById(Long id);

    String getSpecialtyNameFromSpecialtyRecordById(Long id);

    String getNumberFromSpecialtyRecordById(Long id);

    List<String> getHouseAddress();

    Long getRoomBill();

    Long getSpecialtyBill();

    List<String> getHouseName();

    Integer getRoomBillNumberByHouseName(String name);

    Integer getSpecialtyBillNumberByHouseName(String name);

    String getOwnerByHouseName(String name);
}
