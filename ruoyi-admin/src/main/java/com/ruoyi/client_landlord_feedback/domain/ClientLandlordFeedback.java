package com.ruoyi.client_landlord_feedback.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 我要反馈对象 client_landlord_feedback
 * 
 * @author yyt
 * @date 2022-12-10
 */
public class ClientLandlordFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 账号 */
    @Excel(name = "反馈用户")
    private String userNumber;

    /** 反馈内容 */
    @Excel(name = "反馈内容")
    private String feedbackContent;

    /** 反馈时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "反馈时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date feedbackTime;

    /** 回复内容 */
    @Excel(name = "回复内容")
    private String adminAnswer;

    /** 回复时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "回复时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date answerTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserNumber(String userNumber) 
    {
        this.userNumber = userNumber;
    }

    public String getUserNumber() 
    {
        String userNumber = (String) PermissionUtils.getPrincipalProperty("userName");
        return userNumber;
    }
    public void setFeedbackContent(String feedbackContent) 
    {
        this.feedbackContent = feedbackContent;
    }

    public String getFeedbackContent() 
    {
        return feedbackContent;
    }
    public void setFeedbackTime(Date feedbackTime) 
    {
        this.feedbackTime = feedbackTime;
    }

    public Date getFeedbackTime() 
    {
        return feedbackTime;
    }

    public String getAdminAnswer()
    {
        return adminAnswer;
    }
    public void setAnswerTime(Date answerTime)
    {
        this.answerTime = answerTime;
    }

    public Date getAnswerTime()
    {
        return answerTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userNumber", getUserNumber())
            .append("feedbackContent", getFeedbackContent())
            .append("feedbackTime", getFeedbackTime())
                .append("adminAnswer", getAdminAnswer())
                .append("answerTime", getAnswerTime())
            .toString();
    }
}