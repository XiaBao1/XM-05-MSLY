// pages/loadEdit/loadEdit.js
let getCookie = require("../../../../utils/util.js")['getCookie'];
Page({
  data: {
    feedbackContent: '',
    feedbackDate: '2022-12-31',
    answerContent: '',
    answerDate: '2022-12-31'
  },
  onLoad: function (options) {
    let item = JSON.parse(options.item)
    this.setData({
      feedbackContent: item.feedbackContent,
      feedbackDate: item.feedbackTime,
      answerContent: item.adminAnswer,
      answerDate: item.answerTime
    })
  }
})