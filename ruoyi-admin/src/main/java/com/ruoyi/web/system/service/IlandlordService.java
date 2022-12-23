package com.ruoyi.web.system.service;

import java.util.List;
import com.ruoyi.web.system.domain.landlord;

/**
 * 民宿管理Service接口
 *
 * @author pch
 * @date 2022-12-12
 */
public interface IlandlordService
{
    /**
     * 查询民宿管理
     *
     * @param id 民宿管理主键
     * @return 民宿管理
     */
    public landlord selectlandlordById(Long id);

    /**
     * 查询民宿管理列表
     *
     * @param landlord 民宿管理
     * @return 民宿管理集合
     */
    public List<landlord> selectlandlordList(landlord landlord);

    /**
     * 新增民宿管理
     *
     * @param landlord 民宿管理
     * @return 结果
     */
    public int insertlandlord(landlord landlord);

    /**
     * 修改民宿管理
     *
     * @param landlord 民宿管理
     * @return 结果
     */
    public int updatelandlord(landlord landlord);

    /**
     * 批量删除民宿管理
     *
     * @param ids 需要删除的民宿管理主键集合
     * @return 结果
     */
    public int deletelandlordByIds(String ids);

    /**
     * 删除民宿管理信息
     *
     * @param id 民宿管理主键
     * @return 结果
     */
    public int deletelandlordById(Long id);

    public String getImageUrlById(Long id);

    public List<Integer> getAppointmentData(landlord landlord);
}
