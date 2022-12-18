package com.ruoyi.admin_feedback.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.utils.security.PermissionUtils;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 反馈处理对象 admin_feedback
 * 
 * @author yyt
 * @date 2022-12-17
 */
public class AdminFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long answerId;

    /** 反馈ID */
    private Long feedbackId;

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

    /** 管理员回复 */
    @Excel(name = "管理员回复")
    private String adminAnswer;

    /** 回复时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "回复时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date answerTime;

    public String getUserNumber()
    {
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

    public void setAnswerId(Long answerId) 
    {
        this.answerId = answerId;
    }

    public Long getAnswerId() 
    {
        return answerId;
    }
    public void setFeedbackId(Long feedbackId) 
    {
        this.feedbackId = feedbackId;
    }

    public Long getFeedbackId() 
    {
        return feedbackId;
    }
    public void setAdminAnswer(String adminAnswer) 
    {
        this.adminAnswer = adminAnswer;
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
            .append("answerId", getAnswerId())
            .append("feedbackId", getFeedbackId())
            .append("adminAnswer", getAdminAnswer())
            .append("answerTime", getAnswerTime())
                .append("userNumber", getUserNumber())
                .append("feedbackContent", getFeedbackContent())
                .append("feedbackTime", getFeedbackTime())
            .toString();
    }
}
