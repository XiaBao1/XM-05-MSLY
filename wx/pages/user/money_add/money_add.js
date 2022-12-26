// pages/chongzhi/chongzhi.js
let getCookie = require("../../../utils/util.js")['getCookie'];
Page({

  /**
   * 页面的初始数据
   */
  data: {
    money_add: 0
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   
  },
  inputMoney: function(e) {
    this.setData({
      money_add: e.detail.value
    });
  },
  submitClicked: function() {
    getCookie(this.submitMoney)
  },
  submitMoney: function(cookies) {
    let that = this;
    wx.request({
      url: 'http://localhost/system/user/profile/update',
      header: {'cookie': cookies.data.substring(0, 48), 'X-Requested-With': 'XMLHttpRequest', 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'},
      method: "post",
      data: {money: this.data.money_add},
      success: function(res) {
        console.log(res);
        wx.reLaunch({
          url: '../center/self_center',
        })
      }
    });
  }
})