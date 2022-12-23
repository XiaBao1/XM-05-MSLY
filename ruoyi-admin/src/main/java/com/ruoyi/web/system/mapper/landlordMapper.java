package com.ruoyi.web.system.mapper;

import java.util.List;
import com.ruoyi.web.system.domain.landlord;
import io.swagger.models.auth.In;

/**
 * 民宿管理Mapper接口
 *
 * @author pch
 * @date 2022-12-12
 */
public interface landlordMapper
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
     * 删除民宿管理
     *
     * @param id 民宿管理主键
     * @return 结果
     */
    public int deletelandlordById(Long id);

    /**
     * 批量删除民宿管理
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletelandlordByIds(String[] ids);

    public String getImageUrlById(Long id);

    public Integer getAppointNumber(landlord landlord);

    public Integer getAllAppointNumber(landlord landlord);
}
