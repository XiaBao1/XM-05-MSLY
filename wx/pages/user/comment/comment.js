// pages/goods/goods.js
let getCookie = require("../../../utils/util.js")['getCookie'];
let sortName = 'feedbackTime';
let curIdx = 0;
Page({
  data: {
    feedbackList: []
  },
  onShow: function() {
    getCookie(this.getFeedbackList);
  },
  getFeedbackList: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/client_landlord_feedback/client_landlord_feedback/list',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {orderByColumn: sortName, isAsc: 'asc', pageSize: 100},
      success: function(res) {
        console.log(res);
        that.setFeedbackList(res.data.rows)
      }
    });
  },
  setFeedbackList: function(data){
    this.setData({
      feedbackList: data
    })
  },
  orderTimeClicked: function() {
    sortName = 'feedbackTime';
    getCookie(this.getFeedbackList);
  },
  orderStatusClicked: function() {
    sortName = 'adminAnswer';
    getCookie(this.getFeedbackList);
  },
  addClicked: function() {
    wx.navigateTo({
      url: './add/comment_add',
    })
  },
  statisticsClicked: function() {
    let numTodo = this.data.feedbackList.length;
    let numDone = 0;
    for (let i = 0; i < numTodo; i++) {
      if (this.data.feedbackList[i].adminAnswer != null) {
        numDone++
      }
    }
    wx.navigateTo({
      url: './statistics/statistics?doneRatio=' + (numDone / numTodo),
    })
  },
  deleteFeedbackClicked: function(e) {
    curIdx = e.currentTarget.dataset.idx;
    getCookie(this.deleteFeedback)
  },
  deleteFeedback: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/client_landlord_feedback/client_landlord_feedback/remove',
      header: {'cookie': cookies.data.substring(0, 48), 'Content-Type': 'application/x-www-form-urlencoded'},
      method: "post",
      data: {ids: this.data.feedbackList[curIdx].id},
      success: function(res) {
        console.log(res);
        that.onShow()
      }
    });
  },
  feedbackDetailClicked: function(e) {
    let idx = e.currentTarget.dataset.idx;
    wx.navigateTo({
      url: './detail/comment_detail?item=' + JSON.stringify(this.data.feedbackList[idx]),
    })
  }
})