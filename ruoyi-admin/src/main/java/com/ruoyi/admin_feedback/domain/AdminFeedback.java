package com.ruoyi.admin_feedback.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 反馈处理对象 admin_feedback
 * 
 * @author yyt
 * @date 2022-12-10
 */
public class AdminFeedback extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    private Long id;

    /** 反馈ID */
    @Excel(name = "反馈ID")
    private Long feedbackId;

    /** 管理员回复 */
    @Excel(name = "管理员回复")
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
            .append("id", getId())
            .append("feedbackId", getFeedbackId())
            .append("adminAnswer", getAdminAnswer())
            .append("answerTime", getAnswerTime())
            .toString();
    }
}
